import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
  });

  final VoidCallback? onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.card,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
