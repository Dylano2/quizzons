import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/data/notifiers.dart';
import 'package:quizz_app/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: KConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: isDarkMode ? Colors.amber : Colors.amber,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
