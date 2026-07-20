import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';

abstract class FlashCardRepository {
  Future<FlashCardEntity> getFlashCard(String id);
  Future<FlashCardEntity> addFlashCard(FlashCardEntity flashCard);
  Future<FlashCardEntity> updateFlashCard(FlashCardEntity flashCard);
  Future<List<FlashCardEntity>> getAllFlashCards();

  Future<void> deleteFlashCard(String id);
}
