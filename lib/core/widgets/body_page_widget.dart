import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/utils/sizing.dart';

/// A base widget.
/// Uses [child] when no needs rebuilding.
/// Uses [builder] when the child needs to be rebuilt after main changes.
class BodyPageWidget extends StatelessWidget {
  BodyPageWidget({Key? key, this.child, this.builder})
      : assert(child != null || builder != null, "Child and Builder is null.");

  final Widget? child;
  final viewModel = Modular.get<LanguageViewModel>();
  final Widget Function(BuildContext context)? builder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, _) {
        return Center(
          child: SelectionArea(
            child: SizedBox(
              width: Sizing.widthPerc(0.8),
              child: child ?? builder?.call(context) ?? Container(),
            ),
          ),
        );
      },
    );
  }
}
