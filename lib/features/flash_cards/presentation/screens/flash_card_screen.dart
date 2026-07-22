import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_icons.dart';
import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flashcard_quiz_app/core/ui/widget/common_container.dart';
import 'package:flashcard_quiz_app/core/ui/widget/common_flating_button.dart';
import 'package:flashcard_quiz_app/core/ui/widget/alert_dialog.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_cubit.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_states.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/screens/flash_card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  @override
  void initState() {
    super.initState();

    context.read<FlashCardCubit>().loadFlashCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Flash Cards", style: AppTextStyle.categoryAppbar),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: BlocBuilder<FlashCardCubit, FlashCardState>(
        builder: (context, state) {
          if (state is LoadingFlashCardState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorFlashCardState) {
            return Center(child: Text(state.message));
          }
          if (state is LoadedFlashCardState) {
            final flashCards = state.flashCards
                .where((card) => card.category == widget.categoryId)
                .toList();

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: flashCards.length,
                itemBuilder: (context, index) {
                  final flashCard = flashCards[index];
                  return CommonContainer(
                    icon: AppIcons.note,
                    text: flashCard.question,
                    onDelete: () => _onDelete(context, flashCard),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              FlashCardDetailsScreen(flashCard: flashCard),
                        ),
                      );
                    },
                    onUpdate: () => _onUpdate(context, flashCard),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: CommonFlatingButton(
        onPressed: () => _addFlashCard(context, widget.categoryId),
      ),
    );
  }
}

void _addFlashCard(BuildContext context, String categoryId) {
  final cubit = context.read<FlashCardCubit>();
  showDialog(
    context: context,
    builder: (context) {
      final controller = TextEditingController();
      final answerController = TextEditingController();
      return CategoryAlert(
        hintText: "enter question",
        secondController: answerController,
        header: "add card",
        secondHintText: "enter answer",
        controller: controller,
        onAdd: (name) {
          cubit.addFlashCard(
            FlashCardEntity(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              question: name,
              answer: answerController.text.trim(),
              category: categoryId, // Default answer
            ),
          );
        },
      );
    },
  );
}

void _onDelete(BuildContext context, FlashCardEntity flashCard) {
  final cubit = context.read<FlashCardCubit>();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.background,
      content: const Text("Delete this flash card?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            cubit.deleteFlashCard(flashCard.id);
            Navigator.pop(context);
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}

void _onUpdate(BuildContext context, FlashCardEntity flashCard) {
  final cubit = context.read<FlashCardCubit>();
  final controller = TextEditingController(text: flashCard.question);
  final answerController = TextEditingController(text: flashCard.answer);
  showDialog(
    context: context,
    builder: (_) => CategoryAlert(
      secondController: answerController,
      secondHintText: "",
      hintText: "",
      header: "update card",
      controller: controller,
      onAdd: (question) {
        cubit.updateFlashCard(
          FlashCardEntity(
            id: flashCard.id,
            question: question,
            answer: answerController.text.trim(),
            category: flashCard.category,
          ),
        );
      },
    ),
  );
}
