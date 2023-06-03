import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/LoadingWidget.dart';
import 'package:website/core/widgets/body_page_widget.dart';
import 'package:website/features/projects/presenter/projects_view_model.dart';

import 'widgets/card_widget.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({Key? key}) : super(key: key);

  final projectsViewModel = ProjectsViewModel();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      child: ListenableBuilder(
          listenable: projectsViewModel,
          builder: (context, _) {
            if (projectsViewModel.isLoading) return LoadingWidget(message: LanguageUtils.getString("projects_loading"));

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Sizing.heightPerc(0.65),
                  child: Listener(
                    onPointerSignal: (pointerSignal) {
                      if (pointerSignal is PointerScrollEvent) {
                        scrollController.animateTo(
                          scrollController.offset + pointerSignal.scrollDelta.dy,
                          curve: Curves.decelerate,
                          duration: const Duration(milliseconds: 150),
                        );
                      }
                    },
                    child: SingleChildScrollView(
                      controller: ScrollController(initialScrollOffset: 0.0),
                      child: Wrap(
                        children: projectsViewModel.filterProjectsToList.map((item) => CardWidget(project: item)).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
