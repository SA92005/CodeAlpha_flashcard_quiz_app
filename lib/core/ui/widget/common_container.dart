import 'package:flashcard_quiz_app/core/theme/app_colors.dart';
import 'package:flashcard_quiz_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    required this.onTap,
    required this.text,
    required this.onUpdate,
    required this.onDelete,
    required this.icon,
  });

  final void Function()? onTap;
  final void Function()? onUpdate;
  final void Function()? onDelete;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        onLongPress: onUpdate,
        child: Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: AppColors.card,
            border: Border.all(color: AppColors.primary, width: .5),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.circleAvatarBackground,
                child: icon,
              ),
              SizedBox(width: 10),
              Expanded(child: Text(text)),
              IconButton(onPressed: onDelete, icon: AppIcons.delet),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
