import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flashcard_quiz_app/core/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class CategoryAlert extends StatelessWidget {
  const CategoryAlert({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.header,
    required this.hintText,
    this.secondController,
    this.secondHintText,
  });

  final TextEditingController controller;
  final TextEditingController? secondController;

  final Function(String) onAdd;
  final String header;
  final String hintText;

  final String? secondHintText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Center(child: Text(header, style: AppTextStyle.diolegHeader)),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlashCardField(controller: controller, hintText: hintText),

          if (header == "add card" || header == "update card") ...[
            const SizedBox(height: 12),

            FlashCardField(
              controller: secondController!,
              hintText: secondHintText!,
              maxLines: 5,
            ),
          ],
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            final name = controller.text.trim();

            if (name.isNotEmpty) {
              onAdd(name);
              Navigator.pop(context);
            }
          },
          child: const Text("OK", style: AppTextStyle.diolegHeader),
        ),

        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel", style: AppTextStyle.diolegHeader),
        ),
      ],
    );
  }
}
