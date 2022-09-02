import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/constants.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/change_observer.dart';
import 'package:website/core/widgets/navbar/navbar_entity.dart';
import 'package:website/core/widgets/navbar/navbar_view_model.dart';
import 'package:website/core/widgets/navbar/navbar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final viewModel = Modular.get<LanguageViewModel>();
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
          ChangeObserver(
              value: viewModel,
              builder: (_, LanguageViewModel controller) {
                return NavbarWidget(
                  pages: [
                    NavbarPageEntity(
                      ROUTE_HOME,
                      controller.data["home"],
                    ),
                    NavbarPageEntity(
                      ROUTE_ABOUT,
                      controller.data["about"],
                    ),
                    NavbarPageEntity(
                      ROUTE_SKILLS,
                      controller.data["skills"],
                    ),
                    NavbarPageEntity(
                      ROUTE_PROJECTS,
                      controller.data["projects"],
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
