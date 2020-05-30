import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/settings/devices/settings_devices_bloc.dart';
import 'package:super_green_app/widgets/appbar.dart';
import 'package:super_green_app/widgets/fullscreen.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';
import 'package:super_green_app/widgets/green_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsDevicesBloc, SettingsDevicesBlocState>(
      listener: (BuildContext context, SettingsDevicesBlocState state) {},
      child: BlocBuilder<SettingsDevicesBloc, SettingsDevicesBlocState>(
        bloc: BlocProvider.of<SettingsDevicesBloc>(context),
        builder: (BuildContext context, SettingsDevicesBlocState state) {
          Widget body;

          if (state is SettingsDevicesBlocStateLoading) {
            body = FullscreenLoading(
              title: 'Loading..',
            );
          } else if (state is SettingsDevicesBlocStateNotEmptyBox) {
            body = Fullscreen(
              child: Icon(Icons.do_not_disturb, color: Colors.red, size: 100),
              title: 'Cannot delete lab',
              subtitle: 'Move all plants to another box first.',
            );
          } else if (state is SettingsDevicesBlocStateLoaded) {
            if (state.devices.length == 0) {
              body = _renderNoController(context);
            } else {
              body = ListView.builder(
                itemCount: state.devices.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: SizedBox(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                            'assets/settings/icon_controller.svg')),
                    onLongPress: () {
                      _deleteBox(context, state.devices[index]);
                    },
                    onTap: () {
                      BlocProvider.of<MainNavigatorBloc>(context).add(
                          MainNavigateToSettingsDevice(state.devices[index]));
                    },
                    title: Text('${index + 1}. ${state.devices[index].name}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Tap to open, Long press to delete.'),
                  );
                },
              );
            }
          }
          return Scaffold(
              appBar: SGLAppBar(
                '🤖',
                fontSize: 40,
                backgroundColor: Color(0xff0b6ab3),
                titleColor: Colors.white,
                iconColor: Colors.white,
                hideBackButton: !(state is SettingsDevicesBlocStateLoaded),
                elevation: 10,
              ),
              body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200), child: body));
        },
      ),
    );
  }

  Widget _renderNoController(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 24),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            'You have no controller yet.',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w200),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Add a first',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        Text('CONTROLLER',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w200,
                                color: Color(0xff3bb30b))),
                      ],
                    ),
                  ),
                  GreenButton(
                    title: 'ADD',
                    onPressed: () {
                      BlocProvider.of<MainNavigatorBloc>(context)
                          .add(MainNavigateToAddDeviceEvent());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'OR',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GreenButton(
                        title: 'SHOP NOW',
                        onPressed: () {
                          launch('https://www.supergreelab.com');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('/'),
                      ),
                      GreenButton(
                        title: 'DIY NOW',
                        onPressed: () {
                          launch('https://github.com/supergreenlab/');
                        },
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }

  void _deleteBox(BuildContext context, Device device) async {
    bool confirm = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete lab ${device.name}?'),
            content: Text('This can\'t be reverted. Continue?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('NO'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('YES'),
              ),
            ],
          );
        });
    if (confirm) {
      BlocProvider.of<SettingsDevicesBloc>(context)
          .add(SettingsDevicesBlocEventDeleteBox(device));
    }
  }
}
