import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class FlashCardGetUsecases {
  final FlashCardRepository repository;
  FlashCardGetUsecases({required this.repository});
  Future<FlashCardEntity> call(String id) {
    return repository.getFlashCard(id);
  }
}
