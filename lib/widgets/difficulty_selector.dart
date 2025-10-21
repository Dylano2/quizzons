import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';

class DifficultySelector extends StatelessWidget {
  final void Function(String difficulty) onDifficultySelected;
  final void Function() onReloadRequested;

  const DifficultySelector({
    super.key,
    required this.onDifficultySelected,
    required this.onReloadRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 60,
        children: [
          Text(KConstants.choseYourDifficulty, style: KTextStyle.primaryText),
          Column(
            spacing: 30,
            children: List.generate(
              KConstants.difficultyLevels.length,
              (index) => SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    onDifficultySelected(KConstants.difficultyLevels[index]);
                    onReloadRequested();
                  },
                  child: Text(KConstants.difficultyLevels[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
