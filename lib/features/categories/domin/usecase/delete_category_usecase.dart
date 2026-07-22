import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class DeleteCategoryUseCase {
  final CategroyRepository categoryRepository;
  final FlashCardRepository flashCardRepository;

  DeleteCategoryUseCase({
    required this.categoryRepository,
    required this.flashCardRepository,
  });

  Future<void> call(String id) async {
    final flashCards = await flashCardRepository.getAllFlashCards();

    final cards = flashCards.where((card) => card.category == id).toList();

    for (final card in cards) {
      await flashCardRepository.deleteFlashCard(card.id);
    }

    await categoryRepository.deleteCategory(id);
  }
}
