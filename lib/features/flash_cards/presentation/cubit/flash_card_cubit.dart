import 'package:flashcard_quiz_app/features/flash_cards/domain/entity/flash_card_entity.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_add_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_delete_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_all_usecase.dart';
// import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_usecases.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_update_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashCardCubit extends Cubit<FlashCardState> {
  FlashCardAddUsecase flashCardAddUsecase;
  FlashCardDeleteUsecase flashCardDeleteUsecase;
  FlashCardGetAllUseCase flashCardGetAllUseCase;
  // FlashCardGetUsecases flashCardGetUsecases;
  FlashCardUpdateUseCase flashCardUpdateUseCase;

  FlashCardCubit({
    required this.flashCardAddUsecase,
    required this.flashCardDeleteUsecase,
    required this.flashCardGetAllUseCase,
    // required this.flashCardGetUsecases,
    required this.flashCardUpdateUseCase,
  }) : super(InitialFlashCardState());

  List<FlashCardEntity> flashCards = [];
  int currentIndex = 0;
  bool showAnswer = false;

  Future<void> loadFlashCards() async {
    emit(LoadingFlashCardState());
    try {
      flashCards = await flashCardGetAllUseCase();
      currentIndex = 0;
      showAnswer = false;
      emit(
        LoadedFlashCardState(
          flashCards: flashCards,
          currentIndex: currentIndex,
          showAnswer: showAnswer,
        ),
      );
    } catch (e) {
      emit(ErrorFlashCardState(e.toString()));
    }
  }

  Future<void> addFlashCard(FlashCardEntity flashCard) async {
    try {
      await flashCardAddUsecase(flashCard);
      await loadFlashCards();
    } catch (e) {
      emit(ErrorFlashCardState(e.toString()));
    }
  }

  Future<void> updateFlashCard(FlashCardEntity flashCard) async {
    try {
      await flashCardUpdateUseCase(flashCard);
      await loadFlashCards();
    } catch (e) {
      emit(ErrorFlashCardState(e.toString()));
    }
  }

  Future<void> deleteFlashCard(String id) async {
    try {
      await flashCardDeleteUsecase(id);
      await loadFlashCards();
    } catch (e) {
      emit(ErrorFlashCardState(e.toString()));
    }
  }

  void nextCard() {
    if (flashCards.isEmpty) return;

    if (currentIndex < flashCards.length - 1) {
      currentIndex++;
      showAnswer = false;

      emit(
        LoadedFlashCardState(
          flashCards: flashCards,
          currentIndex: currentIndex,
          showAnswer: showAnswer,
        ),
      );
    }
  }

  void previousCard() {
    if (flashCards.isEmpty) return;

    if (currentIndex > 0) {
      currentIndex--;
      showAnswer = false;

      emit(
        LoadedFlashCardState(
          flashCards: flashCards,
          currentIndex: currentIndex,
          showAnswer: showAnswer,
        ),
      );
    }
  }

  void toggleAnswer() {
    showAnswer = !showAnswer;

    emit(
      LoadedFlashCardState(
        flashCards: flashCards,
        currentIndex: currentIndex,
        showAnswer: showAnswer,
      ),
    );
  }
}
