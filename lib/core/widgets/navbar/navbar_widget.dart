import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/languages/language_view_model.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/utils/sizing.dart';
import 'package:website/core/widgets/navbar/navbar_entity.dart';
import 'package:website/core/widgets/navbar/navbar_view_model.dart';

import 'navbar_item_widget.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    Key? key,
    required this.pages,
  }) : super(key: key);

  final List<NavbarPageEntity> pages;

  @override
  _NavbarWidget createState() => _NavbarWidget();
}

class _NavbarWidget extends State<NavbarWidget> {
  final languageViewModel = Modular.get<LanguageViewModel>();
  final navbarViewModel = Modular.get<NavbarViewModel>();
  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: 180,
      height: Sizing.size.height,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: TextButton(
                onPressed: languageViewModel.changeLanguage,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.translate,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "EN/PT",
                      style: styles.textWhite,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: navbarViewModel,
                builder: (context, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pages.map((e) => NavbarItem(item: e, isSelected: navbarViewModel.currentRoute == e.route)).toList(),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}