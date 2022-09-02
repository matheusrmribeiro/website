import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:website/core/widgets/navbar/navbar_entity.dart';

import 'navbar_view_model.dart';

class NavbarItem extends StatefulWidget {
  const NavbarItem({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  final NavbarPageEntity item;
  final isSelected;

  @override
  _NavbarItemState createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  final TextStyles styles = TextStyles();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, bottom: 64),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.zero,
          child: Text(
            widget.item.name,
            style: (widget.isSelected)
                ? styles.hoverIn
                : (isHover)
                    ? styles.hoverIn
                    : styles.hoverOut,
          ),
        ),
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {
          Modular.to.navigate(widget.item.route);
          final navbarViewModel = Modular.get<NavbarViewModel>();
          navbarViewModel.setCurrentRoute(widget.item.route);
        },
      ),
    );
  }
}
