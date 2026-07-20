import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source_impl.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_add_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_delete_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_all_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_usecases.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_update_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // =========================
  // Use Cases
  // =========================
  sl.registerLazySingleton(() => FlashCardAddUsecase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardDeleteUsecase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardGetAllUseCase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardGetUsecases(repository: sl()));
  sl.registerLazySingleton(() => FlashCardUpdateUseCase(repository: sl()));

  // =========================
  // hive
  // =========================
  sl.registerLazySingleton<Box<FlashCardModel>>(
    () => Hive.box<FlashCardModel>('flash_cards'),
  );

  // =========================
  // Data Sources
  // =========================
  sl.registerLazySingleton<FlashCardDataSource>(
    () => FlashCardDataSourceImpl(sl()),
  );
}
