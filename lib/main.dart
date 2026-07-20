import 'package:flashcard_quiz_app/core/di/service_alocator.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(FlashCardModelAdapter());

  await Hive.openBox<FlashCardModel>('flash_cards');

  await init();

  runApp(const FlashCardApp());
}

class FlashCardApp extends StatelessWidget {
  const FlashCardApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}
