import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';

class FlashCardRepoImpl implements FlashCardRepository {
  final FlashCardDataSource dataSource;
  FlashCardRepoImpl({required this.dataSource});

  @override
  Future<FlashCardEntity> addFlashCard(FlashCardEntity flashCard) async {
    final model = FlashCardModel(
      id: flashCard.id,
      question: flashCard.question,
      answer: flashCard.answer,
    );
    final result = await dataSource.addFlashCard(model);
    return result.toEntity();
  }

  @override
  Future<void> deleteFlashCard(String id) async {
    await dataSource.deleteFlashCard(id);
  }

  @override
  Future<List<FlashCardEntity>> getAllFlashCards() async {
    final result = await dataSource.getAllFlashCards();
    return result.map((model) => model.toEntity()).toList();
  }

  @override
  Future<FlashCardEntity> getFlashCard(String id) async {
    final result = await dataSource.getFlashCard(id);
    return result.toEntity();
  }

  @override
  Future<FlashCardEntity> updateFlashCard(FlashCardEntity flashCard) async {
    final model = FlashCardModel(
      id: flashCard.id,
      question: flashCard.question,
      answer: flashCard.answer,
    );
    final result = await dataSource.updateFlashCard(model);
    return result.toEntity();
  }
}
