import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/body_page_widget.dart';
import 'package:website/core/widgets/change_observer.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({Key? key}) : super(key: key);

  final languageViewModel = Modular.get<LanguageViewModel>();
  final style = TextStyles();

  Widget skill(String value) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(value, style: style.skillsStyle),
      );

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Sizing.heightPerc(0.5),
                width: Sizing.widthPerc(0.3),
                child: ListView(
                  children: [
                    Text("HARD SKILLS", style: style.skillsTitleStyle),
                    SizedBox(height: 20),
                    skill("FLUTTER"),
                    skill("KOTLIN"),
                    skill("SQL / NOSQL"),
                    skill("SPRING BOOT"),
                    skill("SCRUM"),
                    skill("JIRA"),
                    skill("GIT / BITBUCKET"),
                    skill("MVVM"),
                  ],
                ),
              ),
              SizedBox(
                height: Sizing.heightPerc(0.5),
                width: Sizing.widthPerc(0.3),
                child: ChangeObserver(
                  value: languageViewModel,
                  builder: (context, LanguageViewModel controller) {
                    return ListView(
                      children: [
                        Text("SOFT SKILLS", style: style.skillsTitleStyle),
                        SizedBox(height: 20),
                        skill(controller.data["skills_body_soft_energized"].toUpperCase()),
                        skill(controller.data["skills_body_soft_attentive"].toUpperCase()),
                        skill(controller.data["skills_body_soft_creative"].toUpperCase()),
                        skill(controller.data["skills_body_soft_team"].toUpperCase()),
                        skill(controller.data["skills_body_soft_communication"].toUpperCase()),
                        skill(controller.data["skills_body_soft_management"].toUpperCase()),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
