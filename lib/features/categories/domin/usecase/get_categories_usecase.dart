import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';

class GetCategoriesUseCase {
  final CategroyRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<List<CategoryEntity>> call() {
    return repository.getCategories();
  }
}
