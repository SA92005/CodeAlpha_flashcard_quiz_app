import 'package:flashcard_quiz_app/features/flash_cards/presentation/widgets/show_answer.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';

class FlashCardDetailsScreen extends StatefulWidget {
  const FlashCardDetailsScreen({
    super.key,
    required this.flashCards,
    required this.initialIndex,
  });

  final List<FlashCardEntity> flashCards;
  final int initialIndex;

  @override
  State<FlashCardDetailsScreen> createState() => _FlashCardDetailsScreenState();
}

class _FlashCardDetailsScreenState extends State<FlashCardDetailsScreen> {
  bool showAnswer = false;
  late int currentIndex;

  FlashCardEntity get flashCard => widget.flashCards[currentIndex];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

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
                border: Border.all(color: AppColors.primary),
              ),
              child: Column(
                children: [
                  const Text("Question", style: AppTextStyle.hintStyle),

                  const SizedBox(height: 15),

                  Text(
                    flashCard.question,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.questionAndAnswer,
                  ),

                  if (showAnswer) ...[
                    const SizedBox(height: 25),

                    const Divider(color: AppColors.primary),

                    const SizedBox(height: 20),

                    const Text("Answer", style: AppTextStyle.hintStyle),

                    const SizedBox(height: 15),

                    Text(
                      flashCard.answer,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.questionAndAnswer,
                    ),
                  ],
                ],
              ),
            ),

            const Spacer(),

            if (!showAnswer)
              CommonButton(
                text: "Show Answer",
                onPressed: () {
                  setState(() {
                    showAnswer = true;
                  });
                },
              ),

            if (showAnswer) ...[
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "Previous",
                      onPressed: currentIndex > 0
                          ? () {
                              setState(() {
                                currentIndex--;
                                showAnswer = false;
                              });
                            }
                          : null,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: CommonButton(
                      text: "Next",
                      onPressed: currentIndex < widget.flashCards.length - 1
                          ? () {
                              setState(() {
                                currentIndex++;
                                showAnswer = false;
                              });
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
