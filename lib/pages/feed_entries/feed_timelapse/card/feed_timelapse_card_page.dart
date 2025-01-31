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
import 'package:share_extend/share_extend.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/explorer/sections/widgets/plant_phase.dart';
import 'package:super_green_app/pages/explorer/sections/widgets/plant_strain.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/card/comments_card_page.dart';
import 'package:super_green_app/data/assets/feed_entry.dart';
import 'package:super_green_app/pages/feed_entries/common/media_state.dart';
import 'package:super_green_app/pages/feed_entries/common/social_bar/social_bar_page.dart';
import 'package:super_green_app/pages/feed_entries/feed_timelapse/card/feed_timelapse_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/feed_bloc.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_entry_state.dart';
import 'package:super_green_app/pages/feeds/feed/bloc/state/feed_state.dart';
import 'package:super_green_app/widgets/feed_card/feed_card.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_date.dart';
import 'package:super_green_app/widgets/feed_card/feed_card_title.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';
import 'package:super_green_app/widgets/media_list.dart';

class FeedTimelapseCardPage extends StatefulWidget {
  static String get feedTimelapseCardPageTitle {
    return Intl.message(
      'Timelapse!',
      name: 'feedTimelapseCardPageTitle',
      desc: 'Feed timelapse card title',
      locale: SGLLocalizations.current?.localeName,
    );
  }

  final Animation<double> animation;
  final FeedState feedState;
  final FeedEntryState state;
  final List<Widget> Function(BuildContext context, FeedEntryState feedEntryState)? cardActions;

  const FeedTimelapseCardPage(this.animation, this.feedState, this.state, {Key? key, this.cardActions})
      : super(key: key);

  @override
  _FeedTimelapseCardPageState createState() => _FeedTimelapseCardPageState();
}

class _FeedTimelapseCardPageState extends State<FeedTimelapseCardPage> {
  int mediaShown = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.state is FeedEntryStateLoaded) {
      return _renderLoaded(context, widget.state as FeedTimelapseState);
    }
    return _renderLoading(context, widget.state);
  }

  Widget _renderLoading(BuildContext context, FeedEntryState state) {
    return FeedCard(
      animation: widget.animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedCardTitle(
            FeedEntryIcons[FE_TIMELAPSE]!,
            FeedTimelapseCardPage.feedTimelapseCardPageTitle,
            widget.state.synced,
            showSyncStatus: !state.isRemoteState,
            showControls: !state.isRemoteState,
            title2: widget.state.showPlantInfos ? widget.state.plantName : null,
          ),
          state.showPlantInfos // TODO this is wrong, will make problems with box feed cards
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(child: PlantStrain(plantSettings: state.plantSettings!)),
                      Expanded(child: PlantPhase(plantSettings: state.plantSettings!, time: state.date)),
                    ],
                  ),
                )
              : Container(),
          Container(
            height: 350,
            alignment: Alignment.center,
            child: FullscreenLoading(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeedCardDate(widget.state, widget.feedState),
          ),
        ],
      ),
    );
  }

  Widget _renderLoaded(BuildContext context, FeedTimelapseState state) {
    return FeedCard(
      animation: widget.animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedCardTitle(
              FeedEntryIcons[FE_TIMELAPSE]!, FeedTimelapseCardPage.feedTimelapseCardPageTitle, state.synced,
              title2: widget.state.showPlantInfos ? widget.state.plantName : null,
              onShare: () {
                MediaState media = state.medias[mediaShown];
                if (media.filePath.endsWith('.mp4')) {
                  ShareExtend.share(media.filePath, "video");
                } else if (media.filePath.endsWith('.jpg')) {
                  ShareExtend.share(media.filePath, "image");
                }
              },
              showSyncStatus: !state.isRemoteState,
              showControls: !state.isRemoteState,
              onDelete: () {
                BlocProvider.of<FeedBloc>(context).add(FeedBlocEventDeleteEntry(state));
              },
              actions: widget.cardActions != null ? widget.cardActions!(context, state) : []),
          state.showPlantInfos
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(child: PlantStrain(plantSettings: state.plantSettings!)),
                      Expanded(child: PlantPhase(plantSettings: state.plantSettings!, time: state.date)),
                    ],
                  ),
                )
              : Container(),
          state.medias.length > 0
              ? MediaList(
                  state.medias,
                  showSyncStatus: !state.isRemoteState,
                  onMediaShown: (int i) {
                    mediaShown = i;
                  },
                  onMediaTapped: (media) {
                    BlocProvider.of<MainNavigatorBloc>(context)
                        .add(MainNavigateToFullscreenMedia(media.thumbnailPath, media.filePath));
                  },
                )
              : Container(),
          SocialBarPage(
            state: state,
            feedState: widget.feedState,
          ),
          CommentsCardPage(
            state: state,
            feedState: widget.feedState,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: FeedCardDate(state, widget.feedState),
          ),
        ],
      ),
    );
  }
}
