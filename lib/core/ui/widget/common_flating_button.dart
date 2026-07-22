import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonFlatingButton extends StatelessWidget {
  const CommonFlatingButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.circleAvatarBackground,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
