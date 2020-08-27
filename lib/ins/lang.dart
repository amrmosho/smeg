import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:Smeg/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

enum Language { en, ar }

class INSLang {
  static Map langData = Map();

  static Future<void> update({Function onDone}) async {
    get_lang(onDone: () async {
      String lang = isRTL() ? "ar" : "en";
      String s = await rootBundle.loadString('assets/lang/' + lang + '.json');
      langData = jsonDecode(s);
      if (onDone != null) {
        onDone(langData);
      }
    });
  }

  static String get(String name) {
    String r = name;
    if (langData.length == 0) {
      update(onDone: (data) {
        if (langData.containsKey(name)) {
          r = langData[name];
        }
      });
    } else {
      if (langData.containsKey(name)) {}
      r = langData[name];
    }
    return r;
  }

  static Future<String> update_lang(Language l, {Function onDone}) async {
    final prefs = await SharedPreferences.getInstance();

    language = l;
    prefs.setInt('lang', language.index);

    if (onDone != null) {
      update(onDone: onDone);
    }
  }

  static Future<bool> get_lang({Function onDone}) async {
    final prefs = await SharedPreferences.getInstance();
    int lang = prefs.getInt('lang') ?? 0;

    if (lang == 0) {
      language = Language.en;
    } else {
      language = Language.ar;
    }

    if (onDone != null) {
      onDone();
    }
  }

  static bool isRTL() {
    return (language == Language.ar);
  }
}
