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
      width: Sizing.size.width,
      height: 40,
      margin: EdgeInsets.only(top: 20),
      child: ListenableBuilder(
        listenable: navbarViewModel,
        builder: (context, _) {
          return Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: widget.pages
                  .map(
                    (e) => Align(
                      alignment: Alignment.center,
                      child: NavbarItem(
                        item: e,
                        isSelected: navbarViewModel.currentRoute == e.route,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
