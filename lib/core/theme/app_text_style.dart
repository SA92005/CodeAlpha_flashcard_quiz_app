import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle categoryAppbar = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle diolegHeader = TextStyle(color: AppColors.primary);

  static const TextStyle hintStyle = TextStyle(color: AppColors.grey);

  static const TextStyle questionAndAnswer = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
