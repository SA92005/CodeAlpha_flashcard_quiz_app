import 'package:flashcard_quiz_app/features/categories/domin/repository/categroy_repository.dart';

class DeleteCategoryUseCase {
  final CategroyRepository repository;

  DeleteCategoryUseCase({required this.repository});

  Future<void> call(String id) {
    return repository.deleteCategory(id);
  }
}
