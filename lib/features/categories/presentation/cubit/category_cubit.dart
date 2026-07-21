import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/add_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/delete_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/get_categories_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/domin/usecase/update_category_usecase.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final AddCategoryUseCase addCategoryUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;

  CategoryCubit({
    required this.addCategoryUseCase,
    required this.getCategoriesUseCase,
    required this.updateCategoryUseCase,
    required this.deleteCategoryUseCase,
  }) : super(InitialCategoryState());

  Future<void> loadCategories() async {
    emit(LoadingCategoryState());

    try {
      final categories = await getCategoriesUseCase();

      emit(LoadedCategoryState(categories));
    } catch (e) {
      emit(ErrorCategoryState(e.toString()));
    }
  }

  Future<void> addCategory(CategoryEntity category) async {
    try {
      await addCategoryUseCase(category);
      await loadCategories();
    } catch (e) {
      emit(ErrorCategoryState(e.toString()));
    }
  }

  Future<void> updateCategory(CategoryEntity category) async {
    try {
      await updateCategoryUseCase(category);
      await loadCategories();
    } catch (e) {
      emit(ErrorCategoryState(e.toString()));
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await deleteCategoryUseCase(id);
      await loadCategories();
    } catch (e) {
      emit(ErrorCategoryState(e.toString()));
    }
  }
}
