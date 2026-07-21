import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:hive/hive.dart';
part 'flash_card_model.g.dart';

@HiveType(typeId: 0)
class FlashCardModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String answer;
  @HiveField(3)
  final String category;

  FlashCardModel({
    required this.question,
    required this.answer,
    required this.id,
    required this.category,
  });
  FlashCardModel.fromEntity(FlashCardEntity entity)
    : id = entity.id,
      question = entity.question,
      answer = entity.answer,
      category = entity.category;

  FlashCardEntity toEntity() {
    return FlashCardEntity(
      id: id,
      question: question,
      answer: answer,
      category: category,
    );
  }
}
