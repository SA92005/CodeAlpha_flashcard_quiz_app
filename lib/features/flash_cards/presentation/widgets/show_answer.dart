import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ShowAnswer extends StatelessWidget {
  const ShowAnswer({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.card,
        ),
        onPressed: onPressed,

        child: const Text("Show Answer"),
      ),
    );
  }
}
