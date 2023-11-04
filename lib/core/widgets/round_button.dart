import 'package:flutter/material.dart';
import 'package:flutter_facebook/core/constants/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.color = AppColors.lightBlueColor,
      this.height = 50});

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.darkBlueColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (color == AppColors.lightBlueColor && onPressed != null)
                  ? AppColors.realWhiteColor
                  : AppColors.darkBlueColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
