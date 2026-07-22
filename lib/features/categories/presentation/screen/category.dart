import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_icons.dart';
import 'package:flashcard_quiz_app/core/theme/app_text_style.dart';
import 'package:flashcard_quiz_app/core/ui/widget/common_container.dart';
import 'package:flashcard_quiz_app/core/ui/widget/common_flating_button.dart';
import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_states.dart';
import 'package:flashcard_quiz_app/core/ui/widget/alert_dialog.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_cubit.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/screens/flash_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: const Text("Category", style: AppTextStyle.categoryAppbar),
        ),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is LoadingCategoryState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorCategoryState) {
            return Center(child: Text(state.message));
          }
          if (state is LoadedCategoryState) {
            final categories = state.categories;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CommonContainer(
                    icon: AppIcons.folder,
                    onDelete: () => _onDelete(context, category),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<FlashCardCubit>(),
                            child: FlashCardScreen(categoryId: category.id),
                          ),
                        ),
                      );
                    },
                    onUpdate: () => _onUpdate(context, category),
                    text: category.name,
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: CommonFlatingButton(
        onPressed: () => _addCategory(context),
      ),
    );
  }
}

void _addCategory(BuildContext context) {
  final cubit = context.read<CategoryCubit>();
  showDialog(
    context: context,
    builder: (context) {
      final controller = TextEditingController();
      return CategoryAlert(
        hintText: "enter category name",
        header: "category",
        controller: controller,
        onAdd: (name) {
          cubit.addCategory(
            CategoryEntity(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: name,
              iconCodePoint: 0xe3af, // Default icon code point
            ),
          );
        },
      );
    },
  );
}

void _onUpdate(BuildContext context, CategoryEntity category) {
  final cubit = context.read<CategoryCubit>();
  final controller = TextEditingController(text: category.name);

  showDialog(
    context: context,
    builder: (context) {
      return CategoryAlert(
        hintText: "",
        header: "update category",
        controller: controller,
        onAdd: (name) {
          cubit.updateCategory(
            CategoryEntity(
              id: category.id,
              name: name,
              iconCodePoint: category.iconCodePoint,
            ),
          );
        },
      );
    },
  );
}

void _onDelete(BuildContext context, CategoryEntity category) {
  final cubit = context.read<CategoryCubit>();
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.background,
      content: const Text("Delete this category?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            cubit.deleteCategory(category.id);
            Navigator.pop(context);
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}
