import 'package:flashcard_quiz_app/features/categories/data/datasource/category_datasource.dart';
import 'package:flashcard_quiz_app/features/categories/data/model/category_model.dart';
import 'package:hive/hive.dart';

class CategoryDatasourceImpl implements CategoryDatasource {
  final Box<CategoryModel> categoryBox;
  CategoryDatasourceImpl({required this.categoryBox});

  @override
  Future<void> addCategory(CategoryModel category) async {
    await categoryBox.put(category.id, category);
  }

  @override
  Future<void> deleteCategory(String id) async {
    await categoryBox.delete(id);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return categoryBox.values.toList();
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await categoryBox.put(category.id, category);
  }
}
