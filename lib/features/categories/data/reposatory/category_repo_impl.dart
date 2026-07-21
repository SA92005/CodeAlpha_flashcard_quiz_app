import 'package:flashcard_quiz_app/features/categories/data/datasource/category_datasource.dart';
import 'package:flashcard_quiz_app/features/categories/data/model/category_model.dart';
import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';

class CategoryRepoImpl implements CategroyRepository {
  final CategoryDatasource categoryDatasource;

  CategoryRepoImpl({required this.categoryDatasource});

  @override
  Future<void> addCategory(CategoryEntity category) async {
    await categoryDatasource.addCategory(CategoryModel.fromEntity(category));
  }

  @override
  Future<void> deleteCategory(String id) async {
    await categoryDatasource.deleteCategory(id);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await categoryDatasource.getCategories();
    return categories.map((category) => category.toEntity()).toList();
  }

  @override
  Future<void> updateCategory(CategoryEntity category) async {
    await categoryDatasource.updateCategory(CategoryModel.fromEntity(category));
  }
}
