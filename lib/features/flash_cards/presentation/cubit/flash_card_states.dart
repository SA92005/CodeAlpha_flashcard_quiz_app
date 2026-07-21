import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';

abstract class FlashCardState {}

class InitialFlashCardState extends FlashCardState {}

class LoadingFlashCardState extends FlashCardState {}

class LoadedFlashCardState extends FlashCardState {
  final List<FlashCardEntity> flashCards;
  final int currentIndex;
  final bool showAnswer;

  LoadedFlashCardState({
    required this.flashCards,
    required this.currentIndex,
    required this.showAnswer,
  });

  FlashCardEntity get currentCard => flashCards[currentIndex];
}

class ErrorFlashCardState extends FlashCardState {
  final String message;

  ErrorFlashCardState(this.message);
}
