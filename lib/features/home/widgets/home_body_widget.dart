import 'package:flutter/material.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({Key? key}) : super(key: key);

  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Sizing.isMobile() ? 30 : 0
      ),
      width: Sizing.widthPerc(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LanguageUtils.getString("home_body_name", isUpperCase: true),
            style: style.homeHeaderStyle,
          ),
          Text(LanguageUtils.getString("home_body_role", isUpperCase: true),
            style: style.homeSubtitleStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(LanguageUtils.getString("home_body_description"),
            style: style.homeDescriptionStyle,
          ),
        ],
      ),
    );
  }
}
