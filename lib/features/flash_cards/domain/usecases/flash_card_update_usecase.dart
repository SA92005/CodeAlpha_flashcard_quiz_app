import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class FlashCardUpdateUseCase {
  final FlashCardRepository repository;

  FlashCardUpdateUseCase({required this.repository});

  Future<FlashCardEntity> call(FlashCardEntity flashCard) {
    return repository.updateFlashCard(flashCard);
  }
}
