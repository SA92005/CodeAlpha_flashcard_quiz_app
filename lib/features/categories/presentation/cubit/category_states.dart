import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';

abstract class CategoryState {}

class InitialCategoryState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final List<CategoryEntity> categories;

  LoadedCategoryState(this.categories);
}

class ErrorCategoryState extends CategoryState {
  final String message;

  ErrorCategoryState(this.message);
}
