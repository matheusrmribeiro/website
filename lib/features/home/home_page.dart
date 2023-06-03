import 'package:flutter/material.dart';
import 'package:website/core/widgets/body_page_widget.dart';
import 'package:website/features/home/widgets/home_body_widget.dart';
import 'package:website/features/home/widgets/home_footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyPageWidget(
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBodyWidget(),
                ],
              ),
            ),
            HomeFooterWidget(),
          ],
        );
      }
    );
  }
}
