import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/url_helper.dart';
import 'package:website/core/widgets/customIcon.dart';

class HomeFooterWidget extends StatelessWidget {
  HomeFooterWidget({Key? key}) : super(key: key);
  final viewModel = Modular.get<LanguageViewModel>();
  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomIcon(
                icon: "icons/linkedin.svg",
                onTap: (){
                  UrlHelper.open("https://www.linkedin.com/in/matheus-ribeiro-miranda/");
                },
              ),
              CustomIcon(
                icon: "icons/github.svg",
                onTap: (){
                  UrlHelper.open("https://github.com/matheusrmribeiro");
                },
              ),
              CustomIcon(
                icon: "icons/instagram.svg",
                onTap: (){
                  UrlHelper.open("https://www.instagram.com/_matheusrm/");
                },
              ),
              CustomIcon(
                icon: "icons/facebook.svg",
                onTap: (){
                  UrlHelper.open("https://www.facebook.com/matheusribeiromiranda");
                },
              ),
              CustomIcon(
                icon: "icons/bookmark.svg",
                onTap: (){
                  UrlHelper.open("https://medium.com/@matheustech");
                },
              ),
              CustomIcon(
                icon: "icons/terminal.svg",
                onTap: (){
                  UrlHelper.open("https://pt.stackoverflow.com/users/87785/matheus-ribeiro");
                },
              ),
            ],
          ),
          Text(LanguageUtils.getString("home_foot"),
            style: style.hintText,
          ),
        ],
      ),
    );
  }
}
