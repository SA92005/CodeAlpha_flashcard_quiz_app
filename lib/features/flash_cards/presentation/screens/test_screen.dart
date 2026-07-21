import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_cubit.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  final List<String> categories = ["Programming", "English", "Science", "Math"];

  String selectedCategory = "Programming";

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FlashCardCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Flash Card Test")),
      body: BlocBuilder<FlashCardCubit, FlashCardState>(
        builder: (context, state) {
          if (state is LoadingFlashCardState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorFlashCardState) {
            return Center(child: Text(state.message));
          }

          if (state is LoadedFlashCardState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: const InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(),
                      ),
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(
                        labelText: "Question",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: answerController,
                      decoration: const InputDecoration(
                        labelText: "Answer",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.addFlashCard(
                            FlashCardEntity(
                              id: DateTime.now().millisecondsSinceEpoch
                                  .toString(),
                              question: questionController.text,
                              answer: answerController.text,
                              category: selectedCategory,
                            ),
                          );

                          questionController.clear();
                          answerController.clear();
                        },
                        child: const Text("Add Flash Card"),
                      ),
                    ),

                    const SizedBox(height: 25),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.flashCards.length,
                      itemBuilder: (context, index) {
                        final card = state.flashCards[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    card.category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                Text(
                                  "Question:",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  card.question,
                                  style: const TextStyle(fontSize: 18),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  "Answer:",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  card.answer,
                                  style: const TextStyle(fontSize: 18),
                                ),

                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          cubit.updateFlashCard(
                                            FlashCardEntity(
                                              id: card.id,
                                              question:
                                                  "${card.question} Updated",
                                              answer: "${card.answer} Updated",
                                              category: card.category,
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.edit),
                                        label: const Text("Update"),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          cubit.deleteFlashCard(card.id);
                                        },
                                        icon: const Icon(Icons.delete),
                                        label: const Text("Delete"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
