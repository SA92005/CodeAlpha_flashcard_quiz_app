import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class FlashCardGetAllUseCase {
  final FlashCardRepository repository;

  FlashCardGetAllUseCase({required this.repository});

  Future<List<FlashCardEntity>> call() {
    return repository.getAllFlashCards();
  }
}
