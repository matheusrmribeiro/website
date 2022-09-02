import 'package:flutter/material.dart';
import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({
    this.icon,
    required this.onTap,
  });

  final IconData? icon;
  final VoidCallback onTap;

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool isHover = false;
  final TextStyles stylesConsts = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 5, right: 5, bottom: 12),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: widget.onTap,
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        child: SizedBox(
          width: 24,
          child: Icon(
            widget.icon,
            color: (isHover) ? Colors.white : AppColors.hintColor,
          ),
        ),
      ),
    );
  }
}
