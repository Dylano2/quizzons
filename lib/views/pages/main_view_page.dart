import 'package:flutter/material.dart';
import 'package:quizz_app/data/notifiers.dart';
import 'package:quizz_app/views/pages/profile_page.dart';
import 'package:quizz_app/views/pages/quizz_page.dart';

List<Widget> pages = [QuizzPage(), ProfilePage()];

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
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.question_mark_outlined),
                label: 'Quizz',
              ),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
          );
        },
      ),
    );
  }
}
