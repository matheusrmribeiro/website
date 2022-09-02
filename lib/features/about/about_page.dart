import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/widgets/body_page_widget.dart';
import 'package:website/core/widgets/change_observer.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final languageViewModel = Modular.get<LanguageViewModel>();
  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      child: ChangeObserver(
          value: languageViewModel,
          builder: (context, LanguageViewModel controller) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Html(
                        style: {
                          "p": Style(
                              fontSize: FontSize(style.homeDescriptionStyle.fontSize, units: "px"),
                              color: AppColors.secondaryTextColor),
                          "b": Style(
                              fontSize: FontSize(TextStyles().homeDescriptionStyle.fontSize, units: "px"),
                              color: AppColors.primaryTextColor)
                        },
                        data: languageViewModel.data["about_body_description"],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.format_quote,
                        color: AppColors.hintColor,
                      ),
                      Text(
                        languageViewModel.data["about_body_quote"],
                        style: style.hintTextBig,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
