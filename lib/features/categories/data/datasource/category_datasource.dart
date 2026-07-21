import 'package:flashcard_quiz_app/features/categories/data/model/category_model.dart';

abstract class CategoryDatasource {
  Future<void> addCategory(CategoryModel category);

  Future<List<CategoryModel>> getCategories();

  Future<void> updateCategory(CategoryModel category);

  Future<void> deleteCategory(String id);
}
