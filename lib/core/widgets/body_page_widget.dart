import 'package:flutter/material.dart';
import 'package:website/core/utils/sizing.dart';

class BodyPageWidget extends StatelessWidget {
  const BodyPageWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectionArea(
        child: SizedBox(
          width: Sizing.widthPerc(0.8),
          child: child,
        ),
      ),
    );
  }
}
