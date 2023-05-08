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
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/pages/feed_entries/feed_ventilation/form/feed_ventilation_form_bloc.dart';
import 'package:super_green_app/widgets/feed_form/slider_form_param.dart';

class FeedVentilationTimerFormPage extends TraceableStatefulWidget {
  static String get instructionsBlowerTimerModeDescription {
    return Intl.message(
      '''This is the **timer based blower control**, in this mode the blower is **in sync with the light timer**. Perfect if the box doesn't have a temperature sensor.\n\nEx: when the timer says 100% (which means all lights are on), it will set the blower power at the **blower day** value below.''',
      name: 'instructionsBlowerTimerModeDescription',
      desc: 'Instructions for blower timer mode',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  final Param humidity;
  final Param temperature;
  final VentilationParamsController paramsController;

  const FeedVentilationTimerFormPage(this.humidity, this.temperature, this.paramsController, {Key? key}) : super(key: key);

  @override
  _FeedVentilationTimerFormPageState createState() => _FeedVentilationTimerFormPageState();
}

class _FeedVentilationTimerFormPageState extends State<FeedVentilationTimerFormPage> {
  int _day = 0;
  int _night = 0;

  @override
  void initState() {
    _day = widget.paramsController.max.value;
    _night = widget.paramsController.min.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MarkdownBody(
            data: FeedVentilationTimerFormPage.instructionsBlowerTimerModeDescription,
            styleSheet: MarkdownStyleSheet(p: TextStyle(color: Colors.black, fontSize: 16)),
          ),
        ),
        SliderFormParam(
          key: Key('night'),
          title: 'Blower night (when lights are off)',
          icon: 'assets/feed_form/icon_blower.svg',
          value: _night.toDouble(),
          min: 0,
          max: 100,
          color: Colors.blue,
          onChanged: (double newValue) {
            setState(() {
              _night = newValue.toInt();
            });
          },
          onChangeEnd: (double newValue) {
            BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
              legacyBlowerParamsController: widget.paramsController.copyWithValues({
                "min": _night,
              }) as LegacyBlowerParamsController,
            ));
          },
        ),
        SliderFormParam(
          key: Key('day'),
          title: 'Blower day (when lights are on)',
          icon: 'assets/feed_form/icon_blower.svg',
          value: _day.toDouble(),
          min: 0,
          max: 100,
          color: Colors.yellow,
          onChanged: (double newValue) {
            setState(() {
              _day = newValue.toInt();
            });
          },
          onChangeEnd: (double newValue) {
            BlocProvider.of<FeedVentilationFormBloc>(context).add(FeedVentilationFormBlocParamsChangedEvent(
              legacyBlowerParamsController: widget.paramsController.copyWithValues({
                "max": _day,
              }) as LegacyBlowerParamsController,
            ));
          },
        ),
      ],
    );
  }
}
