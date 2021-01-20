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

import 'dart:async';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_green_app/data/api/backend/backend_api.dart';
import 'package:super_green_app/data/api/backend/feeds/models/comments.dart';
import 'package:super_green_app/data/api/backend/users/users_api.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/form/comments_form_bloc.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/form/widgets/comment.dart';
import 'package:super_green_app/pages/feed_entries/common/widgets/user_avatar.dart';
import 'package:super_green_app/widgets/appbar.dart';
import 'package:super_green_app/widgets/fullscreen_loading.dart';

const Map<CommentType, Map<String, String>> commentTypes = {
  CommentType.COMMENT: {
    'name': 'Comment',
    'pic': 'assets/feed_card/icon_comment.png',
    'prompt': 'Type your comment',
  },
  CommentType.TIPS: {
    'name': 'Tips&tricks',
    'pic': 'assets/feed_card/icon_tips.png',
    'prompt': 'Type your tips&tricks',
  },
  CommentType.DIAGNOSIS: {
    'name': 'Diagnosis',
    'pic': 'assets/feed_card/icon_diagnosis.png',
    'prompt': 'Type your diagnosis',
  },
  CommentType.RECOMMEND: {
    'name': 'Recommend',
    'pic': 'assets/feed_card/icon_recommend.png',
    'prompt': 'Type your recommendation',
  },
};

class CommentsFormPage extends StatefulWidget {
  @override
  _CommentsFormPageState createState() => _CommentsFormPageState();
}

class _CommentsFormPageState extends State<CommentsFormPage>
    with TickerProviderStateMixin {
  final List<Comment> comments = [];
  User user;
  bool autoFocus;
  Comment replyTo;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final FocusNode inputFocus = FocusNode();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  CommentType type = CommentType.COMMENT;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsFormBloc, CommentsFormBlocState>(
      listener: (BuildContext context, CommentsFormBlocState state) {
        if (state is CommentsFormBlocStateLoaded) {
          setState(() {
            this.autoFocus = state.autoFocus;
            this.user = state.user;
            if (listKey.currentState != null) {
              state.comments.forEach((comment) {
                int index;
                if (comment.replyTo != null) {
                  int startIndex = comments.lastIndexWhere((c) =>
                          c.id == comment.replyTo ||
                          c.replyTo == comment.replyTo) +
                      1;
                  index = comments.lastIndexWhere(
                      (c) =>
                          c.replyTo == comment.replyTo &&
                          c.createdAt.isAfter(comment.createdAt),
                      startIndex);
                  index = index < 0 ? startIndex : index;
                } else {
                  index = comments.indexWhere((c) =>
                      c.replyTo == null &&
                      c.createdAt.isAfter(comment.createdAt));
                  index = index < 0 ? 0 : index;
                }
                listKey.currentState
                    .insertItem(index, duration: Duration(milliseconds: 200));
                comments.insert(index, comment);
              });
              bool wasReplyPosted = state.comments.length == 1 &&
                  state.comments[0].replyTo != null;
              if (scrollController.offset != 0 && !wasReplyPosted) {
                Timer(
                    Duration(milliseconds: 100),
                    () => scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear));
              }
            } else {
              comments.addAll(state.comments);
            }
          });
        } else if (state is CommentsFormBlocStateUpdateComment) {
          int i = comments.indexWhere((c) => c.id == state.comment.id);
          if (i != -1) {
            setState(() {
              comments[i] = state.comment;
            });
          }
        }
      },
      child: BlocBuilder<CommentsFormBloc, CommentsFormBlocState>(
          buildWhen: (CommentsFormBlocState s1, CommentsFormBlocState s2) {
        return !(s2 is CommentsFormBlocStateUpdateComment);
      }, builder: (BuildContext context, CommentsFormBlocState state) {
        List<Widget> body;
        if (state is CommentsFormBlocStateInit) {
          body = [FullscreenLoading()];
        } else if (state is CommentsFormBlocStateLoaded) {
          body = [renderLoaded(context)];
        } else if (state is CommentsFormBlocStateLoading) {
          body = [
            renderLoaded(context),
            FullscreenLoading(),
          ];
        }
        return Scaffold(
          appBar: SGLAppBar(
            'Comments',
            backgroundColor: Colors.white,
            titleColor: Colors.black,
            iconColor: Colors.black,
            elevation: 2,
          ),
          body: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: Stack(
                children: body,
              )),
        );
      }),
    );
  }

  Widget renderLoaded(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: AnimatedList(
          key: listKey,
          controller: scrollController,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) =>
                  FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                          sizeFactor: animation,
                          child: CommentView(
                            comment: comments[index],
                            first: index == 0,
                            replyTo: () {
                              setState(() {
                                replyTo = comments[index];
                                inputFocus.requestFocus();
                                type = CommentType.COMMENT;
                                textEditingController.text = '@stant ';
                                //textEditingController =
                                //    TextEditingController(text: '@stant ');
                              });
                            },
                          ))),
          initialItemCount: comments.length,
        )),
        renderInputContainer(context),
      ],
    );
  }

  Widget renderInputContainer(BuildContext context) {
    Widget content;

    if (replyTo != null) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserAvatar(
                icon: replyTo.pic,
                size: 25,
              ),
              Text(
                'Replying to ',
                style: TextStyle(
                  color: Color(0xff474747),
                  fontSize: 16,
                ),
              ),
              Text(
                replyTo.from,
                style: TextStyle(
                  color: Color(0xff474747),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    type = CommentType.COMMENT;
                    FocusScope.of(context).unfocus();
                    replyTo = null;
                  });
                },
                icon: Icon(Icons.close, size: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              replyTo.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      );
    } else if (type == CommentType.COMMENT) {
      content = Column(children: [
        Text(
          'What kind of post do you want to do?',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff787878), fontSize: 17),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            renderType(context, CommentType.COMMENT),
            renderType(context, CommentType.TIPS),
            renderType(context, CommentType.DIAGNOSIS),
            renderType(context, CommentType.RECOMMEND),
          ],
        ),
      ]);
    } else {
      Map<String, String> commentType = commentTypes[type];
      content = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(commentType['pic'], width: 25, height: 25),
        ),
        Text(
          commentType['name'],
          style: TextStyle(
            color: Color(0xff474747),
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              type = CommentType.COMMENT;
              FocusScope.of(context).unfocus();
            });
          },
          icon: Icon(Icons.close),
        ),
      ]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        height: 1,
        color: Color(0xffcdcdcd),
        margin: EdgeInsets.only(bottom: 6.0),
      ),
      AnimatedSizeAndFade(
          vsync: this,
          fadeDuration: Duration(milliseconds: 200),
          sizeDuration: Duration(milliseconds: 200),
          child: content),
      renderInput(context),
    ]);
  }

  Widget renderInput(BuildContext context) {
    String pic = user.pic;
    if (pic != null) {
      pic = BackendAPI().feedsAPI.absoluteFileURL(pic);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UserAvatar(
            icon: pic,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      child: TextField(
                        autofocus: autoFocus,
                        focusNode: inputFocus,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a comment as stant...'),
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(fontSize: 17),
                        minLines: 1,
                        maxLines: 4,
                        controller: textEditingController,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<CommentsFormBloc>(context).add(
                          CommentsFormBlocEventPostComment(
                              textEditingController.text, type, replyTo));
                      FocusScope.of(context).unfocus();
                      textEditingController.clear();
                      type = CommentType.COMMENT;
                      replyTo = null;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text('Post',
                          style: TextStyle(
                              color: Color(0xff001AFF),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderType(BuildContext context, CommentType type) {
    Map<String, String> commentType = commentTypes[type];
    return InkWell(
        onTap: () {
          setState(() {
            if (type == CommentType.COMMENT) {
              return;
            }

            this.type = type;
            inputFocus.requestFocus();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                commentType['name'],
                style: TextStyle(
                    color: Color(0xff474747),
                    fontSize: 16,
                    fontWeight: this.type == type
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: this.type == type ? 2 : 1,
                        color: this.type == type
                            ? Color(0xff3bb30b)
                            : Color(0xffbdbdbd)),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Image.asset(commentType['pic'], width: 25, height: 25),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    inputFocus.dispose();
    super.dispose();
  }
}
