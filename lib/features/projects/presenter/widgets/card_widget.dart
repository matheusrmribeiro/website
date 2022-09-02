import 'package:flutter/material.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/url_helper.dart';
import 'package:website/features/projects/domain/entities/repos_entity.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.project}) : super(key: key);

  final ReposEntity project;
  final style = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              UrlHelper.open(project.url);
            },
            child: Container(
              height: 450,
              width: 250,
              decoration: BoxDecoration(
                  color: AppColors.accentColor,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(project.name, style: style.projectNameStyle),
          Text(
            project.description ?? "",
            style: style.projectDescriptionStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
