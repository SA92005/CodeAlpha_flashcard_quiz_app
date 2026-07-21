import 'package:flashcard_quiz_app/features/categories/domin/entity/categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final IconData iconData;

  CategoryModel({required this.id, required this.name, required this.iconData});

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      iconData: entity.icon,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, icon: iconData);
  }
}
