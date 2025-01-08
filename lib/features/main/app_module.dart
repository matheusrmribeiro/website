import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/api/api_client.dart';
import 'package:website/core/constants.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/widgets/navbar/navbar_view_model.dart';
import 'package:website/features/about/about_page.dart';
import 'package:website/features/home/home_page.dart';
import 'package:website/features/main/main_page.dart';
import 'package:website/features/projects/presenter/projects_page.dart';
import 'package:website/features/skills/skills_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LanguageViewModel()),
        Bind((i) => NavbarViewModel()),
        Bind.singleton((i) => APIClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ROUTE_MAIN,
          child: (context, args) => MainPage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
