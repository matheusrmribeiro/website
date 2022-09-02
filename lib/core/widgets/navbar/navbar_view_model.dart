import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavbarViewModel extends ChangeNotifier {

  String _currentRoute = "";

  String get currentRoute {
    if (_currentRoute == "")
      return Modular.to.path;
    else
      return _currentRoute;
  }

  void setCurrentRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }

}