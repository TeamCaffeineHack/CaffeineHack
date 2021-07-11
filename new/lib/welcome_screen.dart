import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_second_chapter/login_screen.dart';
import 'package:the_second_chapter/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:the_second_chapter/charity_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: controller.value * 150,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  Center(
                    child: Text(
                      'The Second Chapter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.white,
                        fontFamily: 'Otomanopee',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.tealAccent.shade700,
                      borderRadius: BorderRadius.circular(40.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        minWidth: 300.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.tealAccent.shade700,
                      borderRadius: BorderRadius.circular(40.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        minWidth: 300.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(10.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, CharityScreen.id);
                            },
                            minWidth: 150.0,
                            height: 60.0,
                            child: Text(
                              'Charitable Organisation',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
