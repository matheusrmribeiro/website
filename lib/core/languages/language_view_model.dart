import 'package:flutter/widgets.dart';
import 'portuguese.dart';
import 'english.dart';

class LanguageViewModel extends ChangeNotifier {

  Map<String, dynamic> data = english["strings"];
  String? currentLanguage = english["code"];

  void changeLanguage() {
    if (currentLanguage == "PT") {
      data = english["strings"];
      currentLanguage = english["code"];
    } else {
      data = portuguese["strings"];
      currentLanguage = portuguese["code"];
    }
    notifyListeners();
  }

}