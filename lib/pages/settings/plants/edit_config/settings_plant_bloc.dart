import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor/moor.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';

abstract class SettingsPlantBlocEvent extends Equatable {}

class SettingsPlantBlocEventInit extends SettingsPlantBlocEvent {
  @override
  List<Object> get props => [];
}

class SettingsPlantBlocEventUpdate extends SettingsPlantBlocEvent {
  final String name;
  final Box box;

  SettingsPlantBlocEventUpdate(this.name, this.box);

  @override
  List<Object> get props => [name, box];
}

abstract class SettingsPlantBlocState extends Equatable {}

class SettingsPlantBlocStateLoading extends SettingsPlantBlocState {
  @override
  List<Object> get props => [];
}

class SettingsPlantBlocStateLoaded extends SettingsPlantBlocState {
  final Plant plant;
  final Box box;

  SettingsPlantBlocStateLoaded(this.plant, this.box);

  @override
  List<Object> get props => [plant, box];
}

class SettingsPlantBlocStateDone extends SettingsPlantBlocState {
  final Plant plant;
  final Box box;

  SettingsPlantBlocStateDone(this.plant, this.box);

  @override
  List<Object> get props => [plant, box];
}

class SettingsPlantBloc
    extends Bloc<SettingsPlantBlocEvent, SettingsPlantBlocState> {
  //ignore: unused_field
  final MainNavigateToSettingsPlant args;
  Plant plant;
  Box box;

  SettingsPlantBloc(this.args) {
    add(SettingsPlantBlocEventInit());
  }

  @override
  SettingsPlantBlocState get initialState => SettingsPlantBlocStateLoading();

  @override
  Stream<SettingsPlantBlocState> mapEventToState(
      SettingsPlantBlocEvent event) async* {
    if (event is SettingsPlantBlocEventInit) {
      plant = await RelDB.get().plantsDAO.getPlant(args.plant.id);
      box = await RelDB.get().plantsDAO.getBox(plant.box);
      yield SettingsPlantBlocStateLoaded(plant, box);
    } else if (event is SettingsPlantBlocEventUpdate) {
      yield SettingsPlantBlocStateLoading();
      await RelDB.get().plantsDAO.updatePlant(PlantsCompanion(
          id: Value(plant.id),
          name: Value(event.name),
          box: Value(event.box.id),
          synced: Value(false)));
      yield SettingsPlantBlocStateDone(plant, box);
    }
  }
}
