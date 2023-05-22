import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
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
      height: Sizing.widthPerc(1),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                UrlHelper.open(project.url);
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: SvgPicture.asset(
                    "icons/share.svg",
                    color: AppColors.primaryColor,
                  ),
                ),
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
