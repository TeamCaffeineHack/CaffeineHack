import 'package:flutter/material.dart';
import 'package:the_second_chapter/registration_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';

void main() {
  runApp(SecondChapter());
}

class SecondChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
