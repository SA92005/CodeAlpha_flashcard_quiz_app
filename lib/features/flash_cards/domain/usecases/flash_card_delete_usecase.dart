import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class FlashCardDeleteUsecase {
  final FlashCardRepository repository;
  FlashCardDeleteUsecase({required this.repository});
  Future<void> call(String id) {
    return repository.deleteFlashCard(id);
  }
}
