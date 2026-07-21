import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flashcard_quiz_app/features/categories/presentation/cubit/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTestScreen extends StatefulWidget {
  const CategoryTestScreen({super.key});

  @override
  State<CategoryTestScreen> createState() => _CategoryTestScreenState();
}

class _CategoryTestScreenState extends State<CategoryTestScreen> {
  final TextEditingController controller = TextEditingController();

  final List<IconData> icons = [
    Icons.code,
    Icons.language,
    Icons.science,
    Icons.calculate,
  ];

  int selectedIcon = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Category Test")),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is LoadingCategoryState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorCategoryState) {
            return Center(child: Text(state.message));
          }

          if (state is LoadedCategoryState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: "Category Name",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  DropdownButton<int>(
                    value: selectedIcon,
                    isExpanded: true,
                    items: List.generate(
                      icons.length,
                      (index) => DropdownMenuItem(
                        value: index,
                        child: Row(
                          children: [
                            Icon(icons[index]),
                            const SizedBox(width: 10),
                            Text("Icon ${index + 1}"),
                          ],
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedIcon = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.trim().isEmpty) return;

                        cubit.addCategory(
                          CategoryEntity(
                            id: DateTime.now().millisecondsSinceEpoch
                                .toString(),
                            name: controller.text.trim(),
                            iconCodePoint: icons[selectedIcon].codePoint,
                          ),
                        );

                        controller.clear();
                      },
                      child: const Text("Add Category"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Icon(IconData(category.iconCodePoint)),
                            title: Text(category.name),
                            subtitle: Text("ID: ${category.id}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    cubit.updateCategory(
                                      CategoryEntity(
                                        id: category.id,
                                        name: "${category.name} Updated",
                                        iconCodePoint: category.iconCodePoint,
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    cubit.deleteCategory(category.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
