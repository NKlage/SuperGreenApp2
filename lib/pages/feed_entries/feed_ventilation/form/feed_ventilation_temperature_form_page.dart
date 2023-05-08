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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:super_green_app/data/analytics/matomo.dart';
import 'package:super_green_app/data/kv/app_db.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/pages/feed_entries/feed_ventilation/form/feed_ventilation_form_bloc.dart';
import 'package:super_green_app/widgets/feed_form/number_form_param.dart';
import 'package:super_green_app/widgets/feed_form/slider_form_param.dart';

class FeedVentilationTemperatureFormPage extends TraceableStatefulWidget {
  static String get instructionsBlowerTemperatureModeDescription {
    return Intl.message(
      '''This is the **Temperature based blower control**, in this mode the blower is **in sync with the box temperature sensor**.''',
      name: 'instructionsBlowerTemperatureModeDescription',
      desc: 'Instructions for blower temperature mode',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  final Param humidity;
  final Param temperature;
  final VentilationParamsController paramsController;

  const FeedVentilationTemperatureFormPage(this.humidity, this.temperature, this.paramsController, {Key? key}) : super(key: key);

  @override
  _FeedVentilationTemperatureFormPageState createState() => _FeedVentilationTemperatureFormPageState();
}

class _FeedVentilationTemperatureFormPageState extends State<FeedVentilationTemperatureFormPage> {
  int _min = 0;
  int _max = 0;
  int _refMin = 0;
  int _refMax = 0;

  @override
  void didChangeDependencies() {
    _min = widget.paramsController.min.value;
    _max = widget.paramsController.max.value;
    _refMin = widget.paramsController.refMin.value;
    _refMax = widget.paramsController.refMax.value;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String unit = AppDB().getAppData().freedomUnits == true ? '°F' : '°C';
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MarkdownBody(
            data: FeedVentilationTemperatureFormPage.instructionsBlowerTemperatureModeDescription,
            styleSheet: MarkdownStyleSheet(p: TextStyle(color: Colors.black, fontSize: 16)),
          ),
        ),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(children: [
                      Text(
                        'Low ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                      ),
                      Text(
                        'temperature settings',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
                      ),
                    ]),
                    Text('Current box temperature: ${_tempUnit(widget.temperature.ivalue!.toDouble())}$unit'),
                  ],
                )),
            NumberFormParam(
              title: 'Temperature low',
              icon: 'assets/feed_form/icon_blower.svg',
              value: _refMin.toDouble(),
              unit: unit,
              displayFn: (v) => '${_tempUnit(v)}',
              step: 1,
              onChange: (double newValue) {
                setState(() {
                  _refMin = newValue.toInt();
                });
                BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
                  blowerParamsController: widget.paramsController.copyWithValues({
                    "refMin": newValue.toInt(),
                  }) as BlowerParamsController,
                ));
              },
            ),
            SliderFormParam(
              key: Key('blower_temp_min'),
              title: 'Blower power at ${_tempUnit(_refMin.toDouble())}$unit',
              icon: 'assets/feed_form/icon_blower.svg',
              value: _min.toDouble(),
              min: 0,
              max: 100,
              color: Colors.blue,
              onChanged: (double newValue) {
                setState(() {
                  _min = newValue.toInt();
                });
              },
              onChangeEnd: (double newValue) {
                BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
                  blowerParamsController: widget.paramsController.copyWithValues({
                    "min": _min,
                  }) as BlowerParamsController,
                ));
              },
            ),
          ],
        ),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(children: [
                      Text(
                        'High ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                      ),
                      Text(
                        'temperature settings',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
                      ),
                    ]),
                    Text('Current box temperature: ${_tempUnit(widget.temperature.ivalue!.toDouble())}$unit'),
                  ],
                )),
            NumberFormParam(
              title: 'Temperature high',
              icon: 'assets/feed_form/icon_blower.svg',
              value: _refMax.toDouble(),
              unit: unit,
              displayFn: (v) => '${_tempUnit(v)}',
              step: 1,
              onChange: (double newValue) {
                setState(() {
                  _refMax = newValue.toInt();
                });
                BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
                  blowerParamsController: widget.paramsController.copyWithValues({
                    "refMax": newValue.toInt(),
                  }) as BlowerParamsController,
                ));
              },
            ),
            SliderFormParam(
              key: Key('blower_temp_max'),
              title: 'Blower power at ${_tempUnit(_refMax.toDouble())}$unit',
              icon: 'assets/feed_form/icon_blower.svg',
              value: _max.toDouble(),
              min: 0,
              max: 100,
              color: Colors.yellow,
              onChanged: (double newValue) {
                setState(() {
                  _max = newValue.toInt();
                });
              },
              onChangeEnd: (double newValue) {
                BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
                  blowerParamsController: widget.paramsController.copyWithValues({
                    "max": _max,
                  }) as BlowerParamsController,
                ));
              },
            ),
          ],
        ),
      ],
    );
  }

  double _tempUnit(double temp) {
    if (AppDB().getAppData().freedomUnits == true) {
      return temp * 9 / 5 + 32;
    }
    return temp;
  }
}
