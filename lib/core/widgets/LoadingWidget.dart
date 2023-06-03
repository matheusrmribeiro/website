import 'package:flutter/material.dart';
import 'package:website/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: AppColors.primaryColor),
        SizedBox(height: 10),
        Text(
          message,
          style: TextStyle(color: AppColors.primaryTextColor),
        )
      ],
    );
  }
}
