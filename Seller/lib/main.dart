import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late String title;
  late String category;
  late String link;
  late String condition;
  late String price;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Second Chapter',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Sell a book!'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the title.",
                      labelText: "Title:",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText:
                          "Reference/CBSE/State Board/Notes/Comedy/Action/Non-Fiction/History/Biography/Miscellaneous",
                      labelText: "Category:",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  onChanged: (value) {
                    category = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "How's the current condition of the book?",
                      labelText: "Condition:",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  onChanged: (value) {
                    condition = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the link to access the book image",
                      labelText: "Image Link:",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  onChanged: (value) {
                    link = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the price.",
                      labelText: "Price:",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      _firestore.collection('Sellerdetails').add(
                        {
                          'title': title,
                          'category': category,
                          'condition': condition,
                          'link': link,
                          'price': price
                        },
                      );
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'SELL !!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
            )));
  }
}
