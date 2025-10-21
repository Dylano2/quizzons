import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/data/notifiers.dart';
import 'package:quizz_app/views/pages/main_view_page.dart';

class ScoreCard extends StatefulWidget {
  final int totalQuestion;

  const ScoreCard({super.key, required this.totalQuestion});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    KConstants.finalScore,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple[600],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: scoreNotifier,
                    builder: (context, finalScore, child) {
                      return Text(
                        '$finalScore / ${widget.totalQuestion}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              handleRetry();
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  void handleRetry() {
    scoreNotifier.value = 0;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainViewPage()),
    );
  }
}
