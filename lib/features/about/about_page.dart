import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/body_page_widget.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      builder: (BuildContext context) {
        return Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Html(
                    style: {
                      "p": Style(
                          fontSize: FontSize(style.homeDescriptionStyle.fontSize ?? 12, Unit.px),
                          color: AppColors.secondaryTextColor),
                      "b": Style(
                          fontSize: FontSize(TextStyles().homeDescriptionStyle.fontSize ?? 12, Unit.px),
                          color: AppColors.primaryTextColor)
                    },
                    data: LanguageUtils.getString("about_body_description"),
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
                    LanguageUtils.getString("about_body_quote"),
                    style: Sizing.isMobile() ? style.hintText : style.hintTextBig,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
