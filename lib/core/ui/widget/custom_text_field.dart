import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class FlashCardField extends StatelessWidget {
  const FlashCardField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintStyle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
