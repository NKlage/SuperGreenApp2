import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:moor/moor.dart';
import 'package:super_green_app/data/local/feed_entry_helper.dart';
import 'package:super_green_app/data/rel/rel_db.dart';
import 'package:super_green_app/l10n.dart';
import 'package:super_green_app/towelie/buttons/plant/towelie_button_plant_type.dart';

class CardPlantType {
  static String get toweliePlantType {
    return Intl.message(
      '''To better guide you to a **successful harvest**, I'll need a bit **more informations** about your plant.
Is this plant an **auto** or **photo** strain?''',
      name: 'toweliePlantType',
      desc: 'Towelie Plant auto or photo',
      locale: SGLLocalizations.current.localeName,
    );
  }

  static Future createPlantType(Feed feed) async {
    await FeedEntryHelper.addFeedEntry(FeedEntriesCompanion.insert(
      type: 'FE_TOWELIE_INFO',
      feed: feed.id,
      date: DateTime.now(),
      isNew: Value(true),
      params: Value(JsonEncoder().convert({
        'text': CardPlantType.toweliePlantType,
        'buttons': [
          TowelieButtonPlantAuto.createButton(),
          TowelieButtonPlantPhoto.createButton(),
        ]
      })),
    ));
  }
}
