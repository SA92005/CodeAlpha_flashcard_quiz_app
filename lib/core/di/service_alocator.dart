import 'package:flashcard_quiz_app/features/categories/data/datasource/category_dataSource_impl.dart';
import 'package:flashcard_quiz_app/features/categories/data/datasource/category_datasource.dart';
import 'package:flashcard_quiz_app/features/categories/data/model/category_model.dart';
import 'package:flashcard_quiz_app/features/categories/data/reposatory/category_repo_impl.dart';
import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/add_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/delete_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/get_categories_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/update_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/data_source/flash_card_data_source_impl.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/repository/flash_card_repo_impl.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/repository/flash_card_repository.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_add_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_delete_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_all_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_get_usecases.dart';
import 'package:flashcard_quiz_app/features/flash_cards/domain/usecases/flash_card_update_usecase.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // =========================
  // Use Cases flash card
  // =========================
  sl.registerLazySingleton(() => FlashCardAddUsecase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardDeleteUsecase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardGetAllUseCase(repository: sl()));
  sl.registerLazySingleton(() => FlashCardGetUsecases(repository: sl()));
  sl.registerLazySingleton(() => FlashCardUpdateUseCase(repository: sl()));

  // =========================
  // hive flash card box
  // =========================
  sl.registerLazySingleton<Box<FlashCardModel>>(
    () => Hive.box<FlashCardModel>('flash_cards'),
  );

  // =========================
  // Data Sources flash card
  // =========================
  sl.registerLazySingleton<FlashCardDataSource>(
    () => FlashCardDataSourceImpl(sl()),
  );

  // =========================
  // Repository flash card
  // =========================
  sl.registerLazySingleton<FlashCardRepository>(
    () => FlashCardRepoImpl(dataSource: sl()),
  );

  // =========================
  // cubit flash card
  // =========================
  sl.registerFactory(
    () => FlashCardCubit(
      flashCardAddUsecase: sl(),
      flashCardDeleteUsecase: sl(),
      flashCardGetAllUseCase: sl(),
      // flashCardGetUsecases: sl(),
      flashCardUpdateUseCase: sl(),
    ),
  );

  // =========================
  // Use Cases category
  // =========================
  sl.registerLazySingleton(() => AddCategoryUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => DeleteCategoryUseCase(
      categoryRepository: sl(),
      flashCardRepository: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetCategoriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateCategoryUseCase(repository: sl()));

  // =========================
  // Data Sources category
  // =========================
  sl.registerLazySingleton<CategoryDatasource>(
    () => CategoryDatasourceImpl(categoryBox: sl()),
  );

  // =========================
  // hive category box
  // =========================
  sl.registerLazySingleton<Box<CategoryModel>>(
    () => Hive.box<CategoryModel>('categories'),
  );

  // =========================
  // Repository category
  // =========================
  sl.registerLazySingleton<CategroyRepository>(
    () => CategoryRepoImpl(categoryDatasource: sl()),
  );

  // =========================
  // cubit category
  // =========================
  sl.registerFactory(
    () => CategoryCubit(
      addCategoryUseCase: sl(),
      getCategoriesUseCase: sl(),
      updateCategoryUseCase: sl(),
      deleteCategoryUseCase: sl(),
    ),
  );
}
