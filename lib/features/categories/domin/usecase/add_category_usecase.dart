import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';

class AddCategoryUseCase {
  final CategroyRepository repository;

  AddCategoryUseCase({required this.repository});

  Future<void> call(CategoryEntity category) {
    return repository.addCategory(category);
  }
}
