import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/widgets/show_answer.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';

class FlashCardDetailsScreen extends StatefulWidget {
  const FlashCardDetailsScreen({super.key, required this.flashCard});

  final FlashCardEntity flashCard;

  @override
  State<FlashCardDetailsScreen> createState() => _FlashCardDetailsScreenState();
}

class _FlashCardDetailsScreenState extends State<FlashCardDetailsScreen> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Flash Card", style: AppTextStyle.categoryAppbar),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary, width: 1),
              ),

              child: Column(
                children: [
                  const Text("Question", style: AppTextStyle.hintStyle),

                  const SizedBox(height: 15),

                  Center(
                    child: Text(
                      widget.flashCard.question,
                      style: AppTextStyle.questionAndAnswer,
                    ),
                  ),

                  if (showAnswer) ...[
                    const SizedBox(height: 25),

                    const Divider(color: AppColors.primary),

                    const SizedBox(height: 20),

                    const Text("Answer", style: AppTextStyle.hintStyle),

                    const SizedBox(height: 15),

                    Center(
                      child: Text(
                        widget.flashCard.answer,

                        style: AppTextStyle.questionAndAnswer,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const Spacer(),

            if (!showAnswer)
              ShowAnswer(
                onPressed: () {
                  setState(() {
                    showAnswer = true;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
