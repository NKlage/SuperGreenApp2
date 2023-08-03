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
import 'package:super_green_app/data/rel/checklist/conditions.dart';
import 'package:super_green_app/pages/checklist/create/conditions/metric_condition_page.dart';
import 'package:super_green_app/widgets/green_button.dart';

class CreateMonitoring extends StatefulWidget {
  @override
  State<CreateMonitoring> createState() => _CreateMonitoringState();
}

class _CreateMonitoringState extends State<CreateMonitoring> {

  ChecklistCondition condition = ChecklistConditionMetric();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MetricConditionPage(condition: condition as ChecklistConditionMetric, onUpdate: (ChecklistCondition condition) {
          setState(() {
            this.condition = condition;
          });
        }, hideTitle: true,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GreenButton(
              title: 'Create',
              onPressed: () {

              },
            ),
          ],
        ),
      ],
    );
  }
}