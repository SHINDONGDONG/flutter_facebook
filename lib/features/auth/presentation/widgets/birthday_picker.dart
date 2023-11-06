import 'package:flutter/material.dart';
import 'package:flutter_facebook/core/constants/app_colors.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.dateTime, required this.onPressed});

  final DateTime dateTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.blackColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Birthday (${DateTime.now().year - dateTime.year}) years old",
              style: const TextStyle(color: AppColors.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
