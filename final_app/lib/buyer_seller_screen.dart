import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_second_chapter/charities.dart';
import 'package:the_second_chapter/charity_screen.dart';
import 'package:the_second_chapter/welcome_screen.dart';

class BuyerSellerScreen extends StatefulWidget {
  static String id = 'buyer_seller_screen';
  @override
  _BuyerSellerScreenState createState() => _BuyerSellerScreenState();
}

class _BuyerSellerScreenState extends State<BuyerSellerScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.id);
              }),
        ],
        title: Text(
          'The Second Chapter',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Otomanopee',
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'Would you like to buy, sell or donate?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Otomanopee',
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                color: Colors.grey.shade900,
                minWidth: 300.0,
                height: 100.0,
                child: Text(
                  'BUY',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Otomanopee',
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                color: Colors.grey.shade900,
                minWidth: 300.0,
                height: 100.0,
                child: Text(
                  'SELL',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Otomanopee',
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Charities.id);
                },
                color: Colors.grey.shade900,
                minWidth: 300.0,
                height: 100.0,
                child: Text(
                  'DONATE TO CHARITY',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Otomanopee',
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
