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
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:super_green_app/data/rel/checklist/actions.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/misc/bloc.dart';
import 'package:tuple/tuple.dart';

abstract class AppbarChecklistBlocEvent extends Equatable {}

class AppbarChecklistBlocEventInit extends AppbarChecklistBlocEvent {
  @override
  List<Object> get props => [];
}

class AppbarChecklistBlocEventoad extends AppbarChecklistBlocEvent {
  @override
  List<Object> get props => [];
}

class AppbarChecklistBlocEventCreate extends AppbarChecklistBlocEvent {
  @override
  List<Object> get props => [];
}

abstract class AppbarChecklistBlocState extends Equatable {}

class AppbarChecklistBlocStateInit extends AppbarChecklistBlocState {
  @override
  List<Object> get props => [];
}

class AppbarChecklistBlocStateCreated extends AppbarChecklistBlocState {
  final Plant plant;
  final Box box;
  final Checklist checklist;

  AppbarChecklistBlocStateCreated(this.plant, this.box, this.checklist);

  @override
  List<Object> get props => [
        plant,
        box,
        checklist,
      ];
}

class AppbarChecklistBlocStateLoaded extends AppbarChecklistBlocState {
  final Plant plant;
  final Box box;
  final Checklist? checklist;
  final int nPendingLogs;
  final List<Tuple2<ChecklistSeed, ChecklistAction>>? actions;

  AppbarChecklistBlocStateLoaded(this.plant, this.box, this.checklist, this.nPendingLogs, this.actions);

  @override
  List<Object?> get props => [plant, box, checklist, nPendingLogs, actions];
}

class AppbarChecklistBloc extends LegacyBloc<AppbarChecklistBlocEvent, AppbarChecklistBlocState> {
  final Plant plant;
  final Box box;
  Checklist? checklist;
  List<Tuple2<ChecklistSeed, ChecklistAction>> actions = [];

  StreamSubscription? subChecklist;
  late StreamSubscription subLogs;

  AppbarChecklistBloc(this.plant, this.box) : super(AppbarChecklistBlocStateInit()) {
    add(AppbarChecklistBlocEventInit());
  }

  @override
  Stream<AppbarChecklistBlocState> mapEventToState(AppbarChecklistBlocEvent event) async* {
    if (event is AppbarChecklistBlocEventInit) {
      try {
        checklist = await RelDB.get().checklistsDAO.getChecklistForPlant(this.plant.id);
      } catch (e) {
        subChecklist = RelDB.get().checklistsDAO.watchChecklistForPlant(this.plant.id).listen((event) {
          add(AppbarChecklistBlocEventoad());
        });
        yield AppbarChecklistBlocStateLoaded(this.plant, this.box, checklist, 0, actions);
      }
      subLogs = RelDB.get().checklistsDAO.watchChecklistLogs(checklist!.id).listen((e) {
        add(AppbarChecklistBlocEventoad());
      });
    } else if (event is AppbarChecklistBlocEventoad) {
      try {
        checklist = await RelDB.get().checklistsDAO.getChecklistForPlant(this.plant.id);
      } catch (e) {
        yield AppbarChecklistBlocStateLoaded(this.plant, this.box, checklist, 0, actions);
        return;
      }
      List<ChecklistLog> logs = await RelDB.get().checklistsDAO.getChecklistLogs(checklist!.id, limit: 2);
      actions = [];
      for (int i = 0; i < logs.length; ++i) {
        Map<String, dynamic> action = json.decode(logs[i].action);
        ChecklistSeed checklistSeed = await RelDB.get().checklistsDAO.getChecklistSeed(logs[i].checklistSeed);
        actions.add(Tuple2(checklistSeed, ChecklistAction.fromMap(action)));
      }
      int nPendingLogs = await RelDB.get().checklistsDAO.getNPendingLogs();
      yield AppbarChecklistBlocStateLoaded(this.plant, this.box, checklist, nPendingLogs, actions);
    } else if (event is AppbarChecklistBlocEventCreate) {
      int checklistID = await RelDB.get().checklistsDAO.addChecklist(ChecklistsCompanion.insert(
            plant: this.plant.id,
            synced: Value(false),
          ));
      checklist = await RelDB.get().checklistsDAO.getChecklist(checklistID);
      yield AppbarChecklistBlocStateCreated(this.plant, this.box, checklist!);
    }
  }

  @override
  Future<void> close() async {
    if (subChecklist != null) {
      await subChecklist!.cancel();
    }
    await subLogs.cancel();
    return super.close();
  }
}
