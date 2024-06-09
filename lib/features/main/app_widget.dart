import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';
import 'package:website/core/constants.dart';
import 'package:website/core/utils/custom_scroll_behavior.dart';

import '../../core/languages/language_utils.dart';
import '../../core/theme/app_colors.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(ROUTE_HOME);

    return OKToast(
      child: MaterialApp.router(
        title: LanguageUtils.language["app_name"],
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
        // localizationsDelegates: [
        //   ...GlobalMaterialLocalizations.delegates,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   Locale("en"),
        //   Locale("pt"),
        // ],
        // locale: const Locale("pt"),
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
