import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/views/pages/set_profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Center(
                child: Text(KConstants.appName, style: KTextStyle.mainTitle),
              ),
              SizedBox(height: 120),
              Placeholder(color: Colors.amber, fallbackHeight: 200),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: KButtonStyle.kAmberButtonStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetProfilePage()),
                    );
                  },
                  child: FittedBox(
                    child: Text(
                      KConstants.startButton,
                      style: KTextStyle.mainButtonText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
