import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/change_observer.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({Key? key}) : super(key: key);

  final viewModel = Modular.get<LanguageViewModel>();
  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return ChangeObserver(
      value: viewModel,
      builder: (context, LanguageViewModel controller) {
        return SizedBox(
          width: Sizing.widthPerc(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.data["home_body_name"].toUpperCase(),
                style: style.homeHeaderStyle,
              ),
              Text(controller.data["home_body_role"].toUpperCase(),
                style: style.homeSubtitleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(controller.data["home_body_description"],
                style: style.homeDescriptionStyle,
              ),
            ],
          ),
        );
      }
    );
  }
}
