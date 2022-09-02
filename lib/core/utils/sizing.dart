import 'package:flutter/widgets.dart';

class Sizing {
  static late BuildContext context;

  static double mobileWith = 735.0;

  static bool isMobile() => MediaQuery.of(context).size.width <= mobileWith;

  static Size get size => MediaQuery.of(context).size;

  static double widthPerc(double perc) => size.width * perc;

  static double heightPerc(double perc) => size.height * perc;
}