import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/body_page_widget.dart';
import 'package:website/core/widgets/change_observer.dart';
import 'package:website/features/projects/presenter/projects_view_model.dart';

import 'widgets/card_widget.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({Key? key}) : super(key: key);

  final viewModel = ProjectsViewModel();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      child: ChangeObserver(
        value: viewModel,
        builder: (context, ProjectsViewModel controller) {
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
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemCount: controller.projects.length,
                      itemBuilder: (_, int index) {
                        return CardWidget(project: controller.projects[index]);
                      },
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
