import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_second_chapter/charities.dart';
import 'package:the_second_chapter/welcome_screen.dart';

class CharityScreen extends StatefulWidget {
  static String id = 'charity_screen';

  @override
  _CharityScreenState createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  late String email;
  late String aboutUs;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.home,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'REGISTRATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Otomanopee',
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          height: 100.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email id',
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          aboutUs = value;
                        },
                        decoration: InputDecoration(
                          hintMaxLines: 3,
                          hintText:
                              'Some info about you that will be made available to the users ',
                          prefixIcon: Icon(Icons.article_outlined),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          _firestore.collection('charityinfo').add(
                            {
                              'email': email,
                              'aboutUs': aboutUs,
                            },
                          );
                          showAlertDialog(context);
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget logOutButton = TextButton(
    child: Text("Done"),
    onPressed: () {
      Navigator.pushNamed(context, Charities.id);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Thank you!"),
    content: Text("Your Registration was successful!"),
    actions: [
      logOutButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
