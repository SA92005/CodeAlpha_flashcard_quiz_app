import 'package:flashcard_quiz_app/core/di/service_alocator.dart';
import 'package:flashcard_quiz_app/features/flash_cards/data/models/flash_card_model.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/cubit/flash_card_cubit.dart';
import 'package:flashcard_quiz_app/features/flash_cards/presentation/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(FlashCardModelAdapter());
  // Clear the box for testing purposes
  await Hive.deleteBoxFromDisk('flash_cards');
  await Hive.openBox<FlashCardModel>('flash_cards');

  await init();

  runApp(const FlashCardApp());
}

class FlashCardApp extends StatelessWidget {
  const FlashCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<FlashCardCubit>()..loadFlashCards(),
        child: const TestScreen(),
      ),
    );
  }
}
