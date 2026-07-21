import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';

abstract class CategroyRepository {
  Future<void> addCategory(CategoryEntity category);

  Future<List<CategoryEntity>> getCategories();

  Future<void> updateCategory(CategoryEntity category);

  Future<void> deleteCategory(String id);
}
