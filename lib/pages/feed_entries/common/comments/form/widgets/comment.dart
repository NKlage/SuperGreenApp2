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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:super_green_app/data/api/backend/backend_api.dart';
import 'package:super_green_app/data/api/backend/feeds/models/comments.dart';
import 'package:super_green_app/main/main_navigator_bloc.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/form/comments_form_bloc.dart';
import 'package:super_green_app/pages/feed_entries/common/comments/form/comments_form_page.dart';
import 'package:super_green_app/pages/feed_entries/common/widgets/user_avatar.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  final bool first;
  final Function replyTo;
  final bool loggedIn;

  const CommentView({
    Key key,
    this.comment,
    this.first = false,
    this.replyTo,
    this.loggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pic = comment.pic;
    if (pic != null) {
      pic = BackendAPI().feedsAPI.absoluteFileURL(pic);
    }
    Duration diff = DateTime.now().difference(comment.createdAt);
    Widget avatar = UserAvatar(icon: pic);
    if (comment.type != CommentType.COMMENT) {
      avatar = Stack(
        children: [
          avatar,
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffcdcdcd), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(commentTypes[comment.type]['pic'],
                    width: 30, height: 30),
              )),
        ],
      );
    }
    Widget recommendations = Container();
    if (comment.type == CommentType.RECOMMEND) {
      CommentParam params =
          CommentParam.fromMap(JsonDecoder().convert(comment.params));
      recommendations = Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ...params.recommend.map((p) {
            return Row(
              children: [
                Text(p.name, style: TextStyle(fontWeight: FontWeight.bold)),
                p.supplier != null
                    ? Expanded(
                        child: InkWell(
                        onTap: () {
                          launch(p.supplier.url);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            p.supplier.url,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      ))
                    : Container(),
              ],
            );
          }),
        ]),
      );
    }
    return Padding(
      padding: EdgeInsets.only(
          left: comment.replyTo != null ? 24 : 8.0,
          right: 8.0,
          top: this.first ? 16.0 : 4.0,
          bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatar,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                  child: MarkdownBody(
                    data: '**${comment.from}** ${comment.text}',
                    styleSheet: MarkdownStyleSheet(
                        p: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),
                recommendations,
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          renderDuration(diff),
                          style: TextStyle(color: Color(0xffababab)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (!loggedIn) {
                            createAccountOrLogin(context);
                            return;
                          }
                          replyTo();
                        },
                        child: Text(
                          'Reply',
                          style: TextStyle(color: Color(0xff717171)),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      this.comment.isNew == true
                          ? Text('Sending comment..',
                              style: TextStyle(color: Colors.red))
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (!loggedIn) {
                createAccountOrLogin(context);
                return;
              }
              BlocProvider.of<CommentsFormBloc>(context)
                  .add(CommentsFormBlocEventLike(comment));
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                  'assets/feed_card/button_like${comment.liked ? '_on' : ''}.png',
                  width: 20,
                  height: 20),
            ),
          ),
        ],
      ),
    );
  }

  String renderDuration(Duration diff, {suffix = ''}) {
    int minuteDiff = diff.inMinutes;
    int hourDiff = diff.inHours;
    int dayDiff = diff.inDays;
    String format;
    if (minuteDiff < 1) {
      format = 'few seconds$suffix';
    } else if (minuteDiff < 60) {
      format = '$minuteDiff min';
    } else if (hourDiff < 24) {
      format = '${hourDiff}h';
    } else {
      format = '$dayDiff day${dayDiff > 1 ? 's' : ''}';
    }
    return format;
  }

  void createAccountOrLogin(BuildContext context) async {
    bool confirm = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login required'),
            content: Text('Please log in or create an account.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('CANCEL'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('LOGIN / CREATE ACCOUNT'),
              ),
            ],
          );
        });
    if (confirm) {
      BlocProvider.of<MainNavigatorBloc>(context)
          .add(MainNavigateToSettingsAuth());
    }
  }
}
