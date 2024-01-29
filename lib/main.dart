import 'package:flutter/material.dart';
import 'package:pomodoro_app/pages/pomodoro_page.dart';
import 'package:pomodoro_app/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          Provider<PomodoroStore>(create: (_) => PomodoroStore()),
        ],
        builder: (context, child) => const PomodoroPage(),
      ),
    );
  }
}
