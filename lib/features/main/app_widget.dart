import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';
import 'package:website/core/constants.dart';
import 'package:website/core/utils/custom_scroll_behavior.dart';
import 'package:website/core/utils/sizing.dart';

import '../../core/languages/language_utils.dart';
import '../../core/theme/app_colors.dart';

class AppWidget extends StatefulWidget {

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    Sizing.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: LanguageUtils.language["app_name"],
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          fontFamily: "Montserrat", colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.accentColor).copyWith(background: AppColors.backgroundColor),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
