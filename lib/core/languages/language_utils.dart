import 'package:flutter_modular/flutter_modular.dart';

import 'language_view_model.dart';

class LanguageUtils {
  static Map<String, dynamic> get language => Modular.get<LanguageViewModel>().data;

  static String getString(String resId, { List<String> args = const [], isUpperCase = false }) {
    final String stringValue = language[resId];
    var interpolatedString = stringValue;
    for (var arg in args) {
      interpolatedString = interpolatedString.replaceFirst("%@", arg);
    }
    return (isUpperCase) ? interpolatedString.toUpperCase() : interpolatedString;
  }

}