import 'package:flutter/material.dart';
import 'package:quizz_app/data/notifiers.dart';
import 'package:quizz_app/views/pages/quizz_page.dart';

List<Widget> pages = [QuizzPage()];

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        actions: [],
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: scoreNotifier,
            builder: (context, score, child) {
              return Text(score.toString());
            },
          ),
          ValueListenableBuilder(
            valueListenable: selectedPageNotifier,
            builder: (context, selectedPage, child) {
              return pages.elementAt(selectedPage);
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.question_mark_outlined),
            label: 'Quizz',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
