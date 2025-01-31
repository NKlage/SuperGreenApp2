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
import 'package:intl/intl.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/card/comments_card_page.dart';
import 'package:super_green_app/data/assets/feed_entry.dart';
import 'package:super_green_app/pages/feed_entries/common/social_bar/social_bar_page.dart';
import 'package:super_green_app/pages/feed_entries/entry_params/feed_schedule.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/feed_bloc.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_entry_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_state.dart';
import 'package:super_green_app/widgets/feed_card/feed_card.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_date.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_title.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';

class FeedScheduleCardPage extends StatelessWidget {
  static String get feedScheduleCardPageTitle {
    return Intl.message(
      'Schedule change',
      name: 'feedScheduleCardPageTitle',
      desc: 'Feed schedule card title',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  static String feedScheduleCardPagePhase(String phase) {
    return Intl.message(
      'Flipped to\n$phase',
      args: [phase],
      name: 'feedScheduleCardPagePhase',
      desc: 'Feed schedule card phase',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  final Animation<double> animation;
  final FeedState feedState;
  final FeedEntryState state;
  final List<Widget> Function(BuildContext context, FeedEntryState feedEntryState)? cardActions;

  const FeedScheduleCardPage(this.animation, this.feedState, this.state, {Key? key, this.cardActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state is FeedEntryStateLoaded) {
      return _renderLoaded(context, state as FeedEntryStateLoaded);
    }
    return _renderLoading(context);
  }

  Widget _renderLoading(BuildContext context) {
    return FeedCard(
      animation: animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedCardTitle(
            FeedEntryIcons[FE_SCHEDULE]!,
            FeedScheduleCardPage.feedScheduleCardPageTitle,
            state.synced,
            showSyncStatus: !state.isRemoteState,
            showControls: !state.isRemoteState,
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: FullscreenLoading(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeedCardDate(state, feedState),
          ),
        ],
      ),
    );
  }

  Widget _renderLoaded(BuildContext context, FeedEntryStateLoaded state) {
    FeedScheduleParams params = state.params as FeedScheduleParams;
    return FeedCard(
      animation: animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedCardTitle(
              FeedEntryIcons[FE_SCHEDULE]!, FeedScheduleCardPage.feedScheduleCardPageTitle, state.synced,
              showSyncStatus: !state.isRemoteState, showControls: !state.isRemoteState, onDelete: () {
            BlocProvider.of<FeedBloc>(context).add(FeedBlocEventDeleteEntry(state));
          }, actions: cardActions != null ? cardActions!(context, state) : []),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  FeedScheduleCardPage.feedScheduleCardPagePhase(params.schedule),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300, color: Color(0xff3bb30b)),
                ),
              ],
            ),
          ),
          SocialBarPage(state: state, feedState: feedState),
          CommentsCardPage(state: state, feedState: feedState),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeedCardDate(state, feedState),
          ),
        ],
      ),
    );
  }
}
