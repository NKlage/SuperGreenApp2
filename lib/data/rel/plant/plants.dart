/*
 * Copyright (C) 2018  SuperGreenLab <towelie@supergreenlab.com>
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

import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/misc/map_utils.dart';

part 'plants.g.dart';

class Plants extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get feed => integer()();
  IntColumn get box =>
      integer().nullable()(); // TODO remove nullable() for the next version
  TextColumn get name => text().withLength(min: 1, max: 32)();
  // TODO remove the single param, it's moved to the settings json string
  BoolColumn get single => boolean().withDefault(Constant(false))();

  TextColumn get settings => text().withDefault(Constant('{}'))();

  TextColumn get serverID => text().withLength(min: 36, max: 36).nullable()();
  BoolColumn get synced => boolean().withDefault(Constant(false))();

  static Future<PlantsCompanion> fromMap(Map<String, dynamic> map) async {
    Feed feed = await RelDB.get().feedsDAO.getFeedForServerID(map['feedID']);
    Box box = await RelDB.get().plantsDAO.getBoxForServerID(map['boxID']);
    return PlantsCompanion(
        feed: Value(feed.id),
        box: Value(box.id),
        name: Value(map['name'] as String),
        single: Value(map['single'] as bool),
        settings: Value(map['settings'] as String),
        synced: Value(true),
        serverID: Value(map['id'] as String));
  }

  static Future<Map<String, dynamic>> toMap(Plant plant) async {
    Feed feed = await RelDB.get().feedsDAO.getFeed(plant.feed);
    if (feed.serverID == null) {
      throw 'Missing serverID for feed relation';
    }
    Box box = await RelDB.get().plantsDAO.getBox(plant.box);
    if (box.serverID == null) {
      throw 'Missing serverID for box relation';
    }

    return {
      'id': plant.serverID,
      'feedID': feed.serverID,
      'boxID': box.serverID,
      'name': plant.name,
      'single': plant.single,
      'settings': plant.settings,
    };
  }
}

@DataClassName("Box")
class Boxes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get device => integer().nullable()();
  IntColumn get deviceBox => integer().nullable()();
  TextColumn get name => text().withLength(min: 1, max: 32)();

  TextColumn get settings => text().withDefault(Constant('{}'))();

  TextColumn get serverID => text().withLength(min: 36, max: 36).nullable()();
  BoolColumn get synced => boolean().withDefault(Constant(false))();

  static Future<BoxesCompanion> fromMap(Map<String, dynamic> map) async {
    int deviceID;
    if (map['deviceID'] != null) {
      Device device =
          await RelDB.get().devicesDAO.getDeviceForServerID(map['deviceID']);
      deviceID = device.id;
    }
    return BoxesCompanion(
        device: Value(deviceID),
        deviceBox: Value(map['deviceBox'] as int),
        name: Value(map['name'] as String),
        settings: Value(map['settings'] as String),
        synced: Value(true),
        serverID: Value(map['id'] as String));
  }

  static Future<Map<String, dynamic>> toMap(Box box) async {
    Map<String, dynamic> obj = {
      'id': box.serverID,
      'name': box.name,
      'settings': box.settings,
    };
    if (box.device != null) {
      Device device = await RelDB.get().devicesDAO.getDevice(box.device);
      if (device.serverID == null) {
        throw 'Missing serverID for device relation';
      }
      obj['deviceID'] = device.serverID;
      obj['deviceBox'] = box.deviceBox;
    }
    return obj;
  }
}

class ChartCaches extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get plant => integer()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  DateTimeColumn get date => dateTime()();

  TextColumn get values => text().withDefault(Constant('[]'))();
}

class Timelapses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get plant => integer()();
  TextColumn get ssid => text().withLength(min: 1, max: 64).nullable()();
  TextColumn get password => text().withLength(min: 1, max: 64).nullable()();
  TextColumn get controllerID =>
      text().withLength(min: 1, max: 64).nullable()();
  TextColumn get rotate => text().withLength(min: 1, max: 64).nullable()();
  TextColumn get name => text().withLength(min: 1, max: 64).nullable()();
  TextColumn get strain => text().withLength(min: 1, max: 64).nullable()();
  TextColumn get dropboxToken =>
      text().withLength(min: 1, max: 64).nullable()();
  TextColumn get uploadName => text().withLength(min: 1, max: 64).nullable()();

  TextColumn get serverID => text().withLength(min: 36, max: 36).nullable()();
  BoolColumn get synced => boolean().withDefault(Constant(false))();

  static Future<TimelapsesCompanion> fromMap(Map<String, dynamic> map) async {
    Plant plant =
        await RelDB.get().plantsDAO.getPlantForServerID(map['plantID']);
    return TimelapsesCompanion(
        plant: Value(plant.id),
        controllerID: Value(map['controllerID'] as String),
        rotate: Value(map['rotate'] as String),
        name: Value(map['name'] as String),
        strain: Value(map['strain'] as String),
        dropboxToken: Value(map['dropboxToken'] as String),
        uploadName: Value(map['uploadName'] as String),
        synced: Value(true),
        serverID: Value(map['id'] as String));
  }

  static Future<Map<String, dynamic>> toMap(Timelapse timelapse) async {
    Plant plant = await RelDB.get().plantsDAO.getPlant(timelapse.plant);
    if (plant.serverID == null) {
      throw 'Missing serverID for plant relation';
    }
    return {
      'id': timelapse.serverID,
      'plantID': plant.serverID,
      'controllerID': timelapse.controllerID,
      'rotate': timelapse.rotate,
      'name': timelapse.name,
      'strain': timelapse.strain,
      'dropboxToken': timelapse.dropboxToken,
      'uploadName': timelapse.uploadName,
    };
  }
}

@UseDao(tables: [
  Plants,
  Boxes,
  ChartCaches,
  Timelapses,
], queries: {
  'nPlants': 'SELECT COUNT(*) FROM plants',
  'nBoxes': 'SELECT COUNT(*) FROM boxes',
  'nTimelapses': 'SELECT COUNT(*) FROM timelapses WHERE plant = ?',
  'nPlantsInBox': 'SELECT COUNT(*) FROM plants WHERE box = ?',
})
class PlantsDAO extends DatabaseAccessor<RelDB> with _$PlantsDAOMixin {
  PlantsDAO(RelDB db) : super(db);

  Future<Plant> getPlant(int id) {
    return (select(plants)..where((p) => p.id.equals(id))).getSingle();
  }

  Future<Plant> getPlantForServerID(String serverID) {
    return (select(plants)..where((p) => p.serverID.equals(serverID)))
        .getSingle();
  }

  Future<List<Plant>> getPlants() {
    return select(plants).get();
  }

  Stream<List<Plant>> watchPlants() {
    return select(plants).watch();
  }

  Future<List<Plant>> getUnsyncedPlants() {
    return (select(plants)..where((p) => p.synced.equals(false))).get();
  }

  Future<List<Plant>> getPlantsInBox(int boxID) {
    return (select(plants)..where((p) => p.box.equals(boxID))).get();
  }

  Future<Plant> getPlantWithFeed(int feedID) {
    return (select(plants)..where((p) => p.feed.equals(feedID))).getSingle();
  }

  Stream<Plant> watchPlant(int id) {
    return (select(plants)..where((p) => p.id.equals(id))).watchSingle();
  }

  Future<int> addPlant(PlantsCompanion plant) {
    return into(plants).insert(plant);
  }

  Future updatePlant(PlantsCompanion plant) {
    return (update(plants)..where((p) => p.id.equals(plant.id.value)))
        .write(plant);
  }

  Future deletePlant(Plant plant) {
    return delete(plants).delete(plant);
  }

  Future<Box> getBox(int id) {
    return (select(boxes)..where((b) => b.id.equals(id))).getSingle();
  }

  Future<Box> getBoxForServerID(String serverID) {
    return (select(boxes)..where((b) => b.serverID.equals(serverID)))
        .getSingle();
  }

  Future<List<Box>> getBoxes() {
    return select(boxes).get();
  }

  Future<List<Box>> getUnsyncedBoxes() {
    return (select(boxes)..where((b) => b.synced.equals(false))).get();
  }

  Stream<List<Box>> watchBoxes() {
    return select(boxes).watch();
  }

  Stream<Box> watchBox(int id) {
    return (select(boxes)..where((b) => b.id.equals(id))).watchSingle();
  }

  Future<int> addBox(BoxesCompanion box) {
    return into(boxes).insert(box);
  }

  Future updateBox(BoxesCompanion box) {
    return (update(boxes)..where((b) => b.id.equals(box.id.value))).write(box);
  }

  Future deleteBox(Box box) {
    return delete(boxes).delete(box);
  }

  Future cleanDeviceIDs(int deviceID) {
    return (update(boxes)..where((b) => b.device.equals(deviceID)))
        .write(BoxesCompanion(device: Value(null)));
  }

  Future<int> addChartCache(ChartCachesCompanion chartCache) {
    return into(chartCaches).insert(chartCache);
  }

  Future<ChartCache> getChartCache(int plantID, String name) async {
    List<ChartCache> cs = await (select(chartCaches)
          ..where((c) => c.plant.equals(plantID) & c.name.equals(name)))
        .get();
    if (cs.length == 0) {
      return null;
    }
    return cs[0];
  }

  Stream<ChartCache> watchChartCache(int plantID, String name) {
    return (select(chartCaches)
          ..where((c) => c.plant.equals(plantID) & c.name.equals(name)))
        .watchSingle();
  }

  Future deleteChartCacheForPlant(int plantID) {
    return (delete(chartCaches)..where((cc) => cc.plant.equals(plantID))).go();
  }

  Future deleteChartCache(ChartCache chartCache) {
    return delete(chartCaches).delete(chartCache);
  }

  Future<List<Timelapse>> getTimelapses(int plantID) {
    return (select(timelapses)..where((t) => t.plant.equals(plantID))).get();
  }

  Future<Timelapse> getTimelapseForServerID(String serverID) {
    return (select(timelapses)..where((t) => t.serverID.equals(serverID)))
        .getSingle();
  }

  Future<List<Timelapse>> getUnsyncedTimelapses() {
    return (select(timelapses)..where((b) => b.synced.equals(false))).get();
  }

  Future<int> addTimelapse(TimelapsesCompanion timelapse) {
    return into(timelapses).insert(timelapse);
  }

  Future updateTimelapse(TimelapsesCompanion timelapse) {
    return (update(timelapses)..where((t) => t.id.equals(timelapse.id.value)))
        .write(timelapse);
  }

  Future deleteTimelapse(Timelapse timelapse) {
    return delete(timelapses).delete(timelapse);
  }

  Map<String, dynamic> plantSettings(Plant plant) {
    final Map<String, dynamic> settings = JsonDecoder().convert(plant.settings);
    // TODO make actual enums or constants
    return {
      'phase': settings['phase'] ?? 'VEG', // VEG or BLOOM
      'plantType': settings['plantType'] ?? 'PHOTO', // PHOTO or AUTO
    };
  }

  Map<String, dynamic> boxSettings(Box box) {
    final Map<String, dynamic> settings = JsonDecoder().convert(box.settings);
    // TODO make actual enums or constants
    return {
      'schedule':
          settings['schedule'] ?? 'VEG', // Any of the schedule keys below
      'schedules': {
        'VEG': {
          'ON_HOUR': MapUtils.valuePath(settings, 'schedules.VEG.ON_HOUR') ?? 3,
          'ON_MIN': MapUtils.valuePath(settings, 'schedules.VEG.ON_MIN') ?? 0,
          'OFF_HOUR':
              MapUtils.valuePath(settings, 'schedules.VEG.OFF_HOUR') ?? 21,
          'OFF_MIN': MapUtils.valuePath(settings, 'schedules.VEG.OFF_MIN') ?? 0,
        },
        'BLOOM': {
          'ON_HOUR':
              MapUtils.valuePath(settings, 'schedules.BLOOM.ON_HOUR') ?? 6,
          'ON_MIN': MapUtils.valuePath(settings, 'schedules.BLOOM.ON_MIN') ?? 0,
          'OFF_HOUR':
              MapUtils.valuePath(settings, 'schedules.BLOOM.OFF_HOUR') ?? 18,
          'OFF_MIN':
              MapUtils.valuePath(settings, 'schedules.BLOOM.OFF_MIN') ?? 0,
        },
        'AUTO': {
          'ON_HOUR':
              MapUtils.valuePath(settings, 'schedules.AUTO.ON_HOUR') ?? 0,
          'ON_MIN': MapUtils.valuePath(settings, 'schedules.AUTO.ON_MIN') ?? 0,
          'OFF_HOUR':
              MapUtils.valuePath(settings, 'schedules.AUTO.OFF_HOUR') ?? 0,
          'OFF_MIN':
              MapUtils.valuePath(settings, 'schedules.AUTO.OFF_MIN') ?? 0,
        },
      }
    };
  }
}
