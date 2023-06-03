import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/constants.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/navbar/navbar_entity.dart';
import 'package:website/core/widgets/navbar/navbar_view_model.dart';
import 'package:website/core/widgets/navbar/navbar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navbarViewModel = Modular.get<NavbarViewModel>();

  @override
  void initState() {
    super.initState();
    Sizing.context = context;
    navbarViewModel.setCurrentRoute(Modular.to.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListenableBuilder(
              listenable: Modular.get<LanguageViewModel>(),
              builder: (BuildContext context, Widget? child) {
                return NavbarWidget(
                  pages: [
                    NavbarPageEntity(
                      ROUTE_HOME,
                      LanguageUtils.getString("home"),
                    ),
                    NavbarPageEntity(
                      ROUTE_ABOUT,
                      LanguageUtils.getString("about"),
                    ),
                    NavbarPageEntity(
                      ROUTE_SKILLS,
                      LanguageUtils.getString("skills"),
                    ),
                    NavbarPageEntity(
                      ROUTE_PROJECTS,
                      LanguageUtils.getString("projects"),
                    ),
                  ],
                );
              }),
          Container(
            width: 1,
            color: AppColors.accentColor,
          ),
          Expanded(
            child: RouterOutlet(),
          )
        ],
      ),
    );
  }
}
