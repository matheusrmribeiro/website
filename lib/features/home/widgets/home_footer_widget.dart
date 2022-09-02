import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/url_helper.dart';
import 'package:website/core/widgets/change_observer.dart';
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
                icon: FeatherIcons.linkedin,
                onTap: (){
                  UrlHelper.open("https://www.linkedin.com/in/matheus-ribeiro-miranda/");
                },
              ),
              CustomIcon(
                icon: FeatherIcons.github,
                onTap: (){
                  UrlHelper.open("https://github.com/matheusrmribeiro");
                },
              ),
              CustomIcon(
                icon: FeatherIcons.instagram,
                onTap: (){
                  UrlHelper.open("https://www.instagram.com/_matheusrm/");
                },
              ),
              CustomIcon(
                icon: FeatherIcons.facebook,
                onTap: (){
                  UrlHelper.open("https://www.facebook.com/matheusribeiromiranda");
                },
              ),
              CustomIcon(
                icon: FeatherIcons.bookmark,
                onTap: (){
                  UrlHelper.open("https://medium.com/@matheustech");
                },
              ),
              CustomIcon(
                icon: FeatherIcons.terminal,
                onTap: (){
                  UrlHelper.open("https://pt.stackoverflow.com/users/87785/matheus-ribeiro");
                },
              ),
            ],
          ),
          ChangeObserver(
            value: viewModel,
            builder: (context, LanguageViewModel controller) {
              return Text(controller.data["home_foot"],
                style: style.hintText,
              );
            }
          ),
        ],
      ),
    );
  }
}
