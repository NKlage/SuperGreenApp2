/*
 * Copyright (C) 2022  SuperGreenLab <towelie@supergreenlab.com>
 * Author: Constantin Clauzel <constantin.clauzel@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:super_green_app/misc/bloc.dart';
import 'package:super_green_app/data/rel/rel_db.dart';

// This classe mostly exist as a shitty retro-compatibility layer.

abstract class DeviceNavigationArgHolder {
  Future<Device?> getDevice();
}

abstract class DeviceReachableListenerBlocEvent extends Equatable {}

class DeviceReachableListenerBlocEventLoadDevice extends DeviceReachableListenerBlocEvent {
  final int rand = Random().nextInt(1 << 32);
  final int deviceID;

  DeviceReachableListenerBlocEventLoadDevice(this.deviceID);

  @override
  List<Object> get props => [rand, deviceID];
}

class DeviceReachableListenerBlocEventDeviceReachable extends DeviceReachableListenerBlocEvent {
  final int rand = Random().nextInt(1 << 32);
  final Device device;
  final bool reachable;
  final bool remote;

  DeviceReachableListenerBlocEventDeviceReachable(this.device, this.reachable, this.remote);

  @override
  List<Object> get props => [rand, device, reachable, remote];
}

abstract class DeviceReachableListenerBlocState extends Equatable {}

class DeviceReachableListenerBlocStateInit extends DeviceReachableListenerBlocState {
  @override
  List<Object> get props => [];
}

class DeviceReachableListenerBlocStateDeviceReachable extends DeviceReachableListenerBlocState {
  final int rand = Random().nextInt(1 << 32);
  final Device device;
  final bool reachable;
  final bool remote;
  final bool usingWifi;

  DeviceReachableListenerBlocStateDeviceReachable(this.device, this.reachable, this.remote, this.usingWifi);

  @override
  List<Object> get props => [rand, device, reachable, usingWifi];
}

class DeviceReachableListenerBloc
    extends LegacyBloc<DeviceReachableListenerBlocEvent, DeviceReachableListenerBlocState> {
  final DeviceNavigationArgHolder deviceArgHolder;

  late Device device;

  StreamSubscription<ConnectivityResult>? connectivity;
  bool _usingWifi = false;

  StreamSubscription? subscription;

  DeviceReachableListenerBloc(this.deviceArgHolder) : super(DeviceReachableListenerBlocStateInit());

  @override
  Stream<DeviceReachableListenerBlocState> mapEventToState(DeviceReachableListenerBlocEvent event) async* {
    if (event is DeviceReachableListenerBlocEventLoadDevice) {
      if (subscription == null) {
        device = await deviceArgHolder.getDevice() as Device;
        _usingWifi = await Connectivity().checkConnectivity() == ConnectivityResult.wifi;
        connectivity = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          _usingWifi = (result == ConnectivityResult.wifi);
        });
        subscription = RelDB.get().devicesDAO.watchDevice(device.id).listen((Device? newDevice) {
          add(DeviceReachableListenerBlocEventDeviceReachable(
              newDevice!, newDevice.isReachable || newDevice.isRemote, newDevice.isRemote));
        });
      }
    } else if (event is DeviceReachableListenerBlocEventDeviceReachable) {
      yield DeviceReachableListenerBlocStateDeviceReachable(
        event.device,
        event.reachable,
        event.remote,
        _usingWifi,
      );
    }
  }

  Future<void> close() async {
    subscription?.cancel();
    connectivity?.cancel();
    super.close();
  }
}
