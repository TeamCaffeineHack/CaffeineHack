import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:select_form_field/select_form_field.dart';

final _firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late String title;
  late String link;
  late String condition;
  late String category;
  late String price;
  late String age;
  late String affordability;
  late String email = "";
  late String secemail;
  late String desc;
  late String id = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Second Chapter',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Sell a book!'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const Text(
                    'Hey Seller!!',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your primary mail id.",
                        labelText: "Primary Email:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your secondary mail id.",
                        labelText: "Secondary Email:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      secemail = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the title.",
                        labelText: "Title:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    hintText: "Choose one.",
                    labelText: 'Category:',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    items: _category,
                    onChanged: (value) {
                      category = value;
                    },
                    onSaved: (val) => print(val),
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    hintText: "Choose one.",
                    labelText: 'Condition:',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    items: _condition,
                    onChanged: (value) {
                      condition = value;
                    },
                    onSaved: (val) => print(val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the link to access the book image",
                        labelText: "Image Link:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    keyboardType: TextInputType.url,
                    onChanged: (value) {
                      link = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the price.",
                        labelText: "Price:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      price = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the age in MONTHS.",
                        labelText: "Age of the Book:",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      age = value;
                    },
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    hintText: "Choose one.",
                    labelText: 'Affordablility:',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    items: _affordability,
                    onChanged: (value) {
                      affordability = value;
                    },
                    onSaved: (val) => print(val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText:
                            """Write a small description about the book and other necessary details.Ex:Prices are negotiable etc.""",
                        labelText: "Description:",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                    maxLength: 200,
                    maxLines: 4,
                    onChanged: (value) {
                      desc = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        _firestore.collection('Sellerdetails').add(
                          {
                            'id': id,
                            'email': email,
                            'secemail': secemail,
                            'title': title,
                            'category': category,
                            'condition': condition,
                            'link': link,
                            'price': price,
                            'age': age,
                            'affordability': affordability,
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
              ),
            )));
  }
}

final List<Map<String, dynamic>> _affordability = [
  {
    'value': 'Affordable',
    'label': 'Affordable',
  },
  {
    'value': 'Pricey',
    'label': 'Pricey',
  },
  {
    'value': 'Luxurious',
    'label': 'Luxurious',
  },
];
final List<Map<String, dynamic>> _condition = [
  {
    'value': 'Mint',
    'label': 'Mint',
  },
  {
    'value': 'Slightly_Used',
    'label': 'Slightly_Used',
  },
  {
    'value': 'Worn_Out',
    'label': 'Worn_Out',
  },
];
final List<Map<String, dynamic>> _category = [
  {
    'value': 'Reference',
    'label': 'Reference',
  },
  {
    'value': 'CBSE',
    'label': 'CBSE',
  },
  {
    'value': 'State Board',
    'label': 'State Board',
  },
  {
    'value': 'Notes',
    'label': 'Notes',
  },
  {
    'value': 'Comedy',
    'label': 'Comedy',
  },
  {
    'value': 'Action',
    'label': 'Action',
  },
  {
    'value': 'Non-Fiction',
    'label': 'Non-Fiction',
  },
  {
    'value': 'History',
    'label': 'History',
  },
  {
    'value': 'Biography',
    'label': 'Biography',
  },
  {
    'value': 'Miscellaneous',
    'label': 'Miscellaneous',
  },
];
