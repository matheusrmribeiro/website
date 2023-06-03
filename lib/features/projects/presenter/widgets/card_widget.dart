import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/utils/url_helper.dart';
import 'package:website/features/projects/domain/entities/repos_entity.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.project}) : super(key: key);

  final ReposEntity project;
  final style = TextStyles();

  String getPreviewUrl(String url) {
    return "${url.replaceAll("github.com", "raw.githubusercontent.com")}/main/preview/preview.png";
  }

  String getTopic(List<String> topics) {
    if (project.topics.contains("flutter"))
      return "Flutter";
    else if (project.topics.contains("kotlin"))
      return "Kotlin";
    else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        margin: EdgeInsets.all(20),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  UrlHelper.open(project.url);
                },
                child: Container(
                  width: 250,
                  height: 150,
                  decoration:
                      BoxDecoration(color: AppColors.accentColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Stack(
                      children: [
                        Image.network(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          getPreviewUrl(project.url),
                          loadingBuilder: (context, widget, progress) {
                            if (progress == null)
                              return Center(child: widget);
                            else
                              return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stack) {
                            return Container();
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryColor,
                            ),
                            margin: EdgeInsets.only(right: 15, bottom: 15),
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              "icons/share.svg",
                              color: AppColors.primaryTextColor,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primaryColor,
                              ),
                              margin: EdgeInsets.only(left: 15, bottom: 15),
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Text(
                                getTopic(project.topics),
                                style: TextStyle(
                                  color: AppColors.primaryTextColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
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
            ),
          ],
        ),
      ),
    );
  }
}
