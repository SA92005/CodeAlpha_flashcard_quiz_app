import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:hive/hive.dart';

class FlashCardDataSourceImpl implements FlashCardDataSource {
  final Box<FlashCardModel> box;

  FlashCardDataSourceImpl(this.box);
  @override
  Future<FlashCardModel> addFlashCard(FlashCardModel flashCard) async {
    if (box.containsKey(flashCard.id)) {
      throw Exception("Flash Card already exists");
    }
    await box.put(flashCard.id, flashCard);
    return flashCard;
  }

  @override
  Future<void> deleteFlashCard(String id) async {
    if (!box.containsKey(id)) {
      throw Exception("Flash Card Not Found");
    }
    await box.delete(id);
  }

  @override
  Future<List<FlashCardModel>> getAllFlashCards() async {
    return box.values.toList();
  }

  @override
  Future<FlashCardModel> getFlashCard(String id) async {
    if (!box.containsKey(id)) {
      throw Exception("Flash Card Not Found");
    }
    final flashCard = box.get(id);

    if (flashCard == null) {
      throw Exception('Flash Card Not Found');
    }

    return flashCard;
  }

  @override
  Future<FlashCardModel> updateFlashCard(FlashCardModel flashCard) async {
    if (!box.containsKey(flashCard.id)) {
      throw Exception("Flash Card Not Found");
    }
    await box.put(flashCard.id, flashCard);
    return flashCard;
  }
}
