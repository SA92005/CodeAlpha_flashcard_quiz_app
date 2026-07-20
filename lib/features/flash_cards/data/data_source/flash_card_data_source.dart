import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';

abstract class FlashCardDataSource {
  Future<FlashCardModel> getFlashCard(String id);
  Future<FlashCardModel> addFlashCard(FlashCardModel flashCard);
  Future<FlashCardModel> updateFlashCard(FlashCardModel flashCard);
  Future<List<FlashCardModel>> getAllFlashCards();

  Future<void> deleteFlashCard(String id);
}
