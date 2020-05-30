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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/fullscreen_media/fullscreen_media_bloc.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';
import 'package:video_player/video_player.dart';

class FullscreenMediaPage extends StatefulWidget {
  @override
  _FullscreenMediaPageState createState() => _FullscreenMediaPageState();
}

class _FullscreenMediaPageState extends State<FullscreenMediaPage> {
  VideoPlayerController _videoPlayerController;
  double _opacity = 0.5;
  Matrix4 _matrix = Matrix4.identity();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener(
        bloc: BlocProvider.of<FullscreenMediaBloc>(context),
        listener: (context, state) async {
          if (state is FullscreenMediaBlocStateInit) {
            if (state.isVideo && _videoPlayerController == null) {
              if (state.filePath.startsWith('http')) {
                _videoPlayerController =
                    VideoPlayerController.network(state.filePath);
              } else {
                _videoPlayerController =
                    VideoPlayerController.file(File(state.filePath));
              }
              await _videoPlayerController.initialize();
              _videoPlayerController.play();
              _videoPlayerController.setLooping(true);
              setState(() {});
            }
          }
        },
        child: BlocBuilder<FullscreenMediaBloc, FullscreenMediaBlocState>(
            bloc: BlocProvider.of<FullscreenMediaBloc>(context),
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraint) {
                  return Hero(
                      tag: 'FeedMedia:${state.heroPath ?? state.filePath}',
                      child: GestureDetector(onTap: () {
                        BlocProvider.of<MainNavigatorBloc>(context)
                            .add(MainNavigatorActionPop());
                      }, child: LayoutBuilder(
                        builder: (context, constraints) {
                          Widget body;
                          if (state.isVideo) {
                            if (_videoPlayerController != null &&
                                _videoPlayerController.value.isPlaying) {
                              body = Stack(
                                children: <Widget>[
                                  _renderPicturePlayer(
                                      context, state, constraints),
                                  _renderVideoPlayer(
                                      context, state, constraints)
                                ],
                              );
                            } else {
                              body = Stack(
                                children: <Widget>[
                                  _renderPicturePlayer(
                                      context, state, constraints),
                                  Positioned(
                                    top: constraints.maxHeight / 2 - 20,
                                    height: 40,
                                    left: constraints.maxWidth / 2 - 20,
                                    width: 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 4.0,
                                    ),
                                  ),
                                ],
                              );
                            }
                          } else {
                            body = _renderPicturePlayer(
                                context, state, constraints);
                          }
                          return body;
                        },
                      )));
                },
              );
            }),
      ),
    );
  }

  Widget _renderVideoPlayer(BuildContext context,
      FullscreenMediaBlocState state, BoxConstraints constraints) {
    double width =
        constraints.maxHeight * _videoPlayerController.value.aspectRatio;
    double height = constraints.maxHeight;
    return Stack(children: [
      Positioned(
          left: (constraints.maxWidth - width) / 2,
          top: (constraints.maxHeight - height) / 2,
          child: SizedBox(
              width: width,
              height: height,
              child: VideoPlayer(_videoPlayerController))),
    ]);
  }

  Widget _renderPicturePlayer(BuildContext context,
      FullscreenMediaBlocState state, BoxConstraints constraints) {
    String filePath = state.isVideo ? state.thumbnailPath : state.filePath;
    Widget picture = SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: filePath.startsWith('http')
            ? Image.network(filePath, fit: BoxFit.contain, loadingBuilder:
                (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return FullscreenLoading(
                    percent: loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes);
              })
            : Image.file(
                File(filePath),
                fit: BoxFit.contain,
              ));
    if (state.overlayPath != null) {
      picture = Stack(children: [
        picture,
        Opacity(
            opacity: _opacity,
            child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: state.overlayPath.startsWith('http')
                    ? Image.network(state.overlayPath, fit: BoxFit.contain,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return FullscreenLoading(
                            percent: loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes);
                      })
                    : Image.file(File(state.overlayPath),
                        fit: BoxFit.contain))),
        Positioned(
          left: 30,
          right: 30,
          top: constraints.maxHeight - 70,
          child: Slider(
            onChanged: (double value) {
              setState(() {
                _opacity = value;
              });
            },
            value: _opacity,
          ),
        )
      ]);
    }
    return MatrixGestureDetector(
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            _matrix = MatrixGestureDetector.compose(_matrix, tm, sm, null);
          });
        },
        onGestureEnd: () {
          setState(() {
            _matrix = Matrix4.identity();
          });
        },
        child: Transform(
            transform: _matrix,
            child: Container(color: Colors.black, child: picture)));
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
