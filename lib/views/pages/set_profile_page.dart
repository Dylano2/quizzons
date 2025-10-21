import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/views/pages/main_view_page.dart';
import 'package:quizz_app/widgets/switch_theme_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetProfilePage extends StatefulWidget {
  const SetProfilePage({super.key});

  @override
  State<SetProfilePage> createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  TextEditingController controller = TextEditingController(text: "mama");
  String? error;

  @override
  void initState() {
    clearState();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(KConstants.appName),
        backgroundColor: Colors.amber,
        actions: [SwitchThemeWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text(KConstants.enterYourName, style: KTextStyle.primaryText),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pseudo',
              ),
            ),
            if (error != null)
              Text(error!, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () {
                handleLogin();
              },
              child: Text(
                KConstants.submitNameButton,
                style: KTextStyle.submitButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleLogin() async {
    setState(() {
      error = null;
    });
    if (controller.text.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KConstants.pseudoKey, controller.text);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainViewPage()),
        (route) => false,
      );
    } else {
      setState(() {
        error = "Il faut indiquer un pseudo !";
      });
    }
  }

  void clearState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
