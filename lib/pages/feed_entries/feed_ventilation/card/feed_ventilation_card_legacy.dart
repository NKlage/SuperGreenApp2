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
import 'package:super_green_app/pages/feed_entries/entry_params/feed_ventilation.dart';
import 'package:super_green_app/pages/feed_entries/feed_ventilation/card/feed_ventilation_card_page.dart';

class FeedVentilationCardLegacy extends StatelessWidget {

  final FeedVentilationParams params;

  const FeedVentilationCardLegacy({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _renderValues([params.values.blowerDay, params.values.blowerNight],
            [params.initialValues.blowerDay, params.initialValues.blowerNight]),
      ),
    );
  }

  List<Widget> _renderValues(List<dynamic> values, List<dynamic> initialValues) {
    int i = 0;
    return values
        .map<Map<String, int>>((v) {
          return {
            'i': i,
            'from': initialValues[i++],
            'to': v,
          };
        })
        .where((v) => v['from'] != v['to'])
        .map<Widget>((v) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        v['i'] == 0
                            ? FeedVentilationCardPage.feedVentilationCardPageDay
                            : FeedVentilationCardPage.feedVentilationCardPageNight,
                        style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.grey)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${v['from']}%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                    Icon(Icons.arrow_forward, size: 18),
                    Text('${v['to']}%',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.green)),
                  ],
                ),
              ],
            ),
          );
        })
        .toList();
  }

}