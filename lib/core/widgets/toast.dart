import 'package:website/core/theme/app_colors.dart';
import 'package:website/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

enum ToastKind { error, success }

class Toast {
  static void showMessage(String message, {int duration = 5, ToastKind toastKind = ToastKind.error, double? width}){
    Widget widget = Container(
      height: 60,
      width: width,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (toastKind == ToastKind.error) ? AppColors.textFieldErrorColor : AppColors.textFieldSuccessColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          message,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyles().hint,
        ),
      ),
    );
    showToastWidget(
        widget,
        duration: Duration(seconds: duration),
        position: ToastPosition.bottom,
        dismissOtherToast: true,
        animationCurve: Curves.easeInCubic
    );
  }
}