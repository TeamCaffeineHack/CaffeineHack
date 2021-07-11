import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:the_second_chapter/screens/tabs_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class SellerScreen extends StatefulWidget {
  static const routeName = '/sellers';

  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sellers'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              'Product Information',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your secondary mail id. (for contact)",
                  labelText: "Secondary Email:",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  fillColor: Colors.white),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                secemail = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the title.",
                  labelText: "Title:",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  fillColor: Colors.white),
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              hintText: "Choose one.",
              labelText: 'Category:',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              items: _category,
              onChanged: (value) {
                category = value;
              },
              onSaved: (val) => print(val),
            ),
            SizedBox(
              height: 10.0,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              hintText: "Choose one.",
              labelText: 'Condition:',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              items: _condition,
              onChanged: (value) {
                condition = value;
              },
              onSaved: (val) => print(val),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the link to access the book image",
                  labelText: "Image Link:",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  fillColor: Colors.white),
              keyboardType: TextInputType.url,
              onChanged: (value) {
                link = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the price.",
                  labelText: "Price:",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  fillColor: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                price = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the age in MONTHS.",
                  labelText: "Age of the Book:",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  fillColor: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                age = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              hintText: "Choose one.",
              labelText: 'Affordability:',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              items: _affordability,
              onChanged: (value) {
                affordability = value;
              },
              onSaved: (val) => print(val),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText:
                      """Write a small description about the book and other necessary details.Ex:Prices are negotiable etc.""",
                  labelText: "Description:",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.white),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
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
              color: Colors.tealAccent,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {
                  try {
                    _firestore.collection('Sellerdetails').add(
                      {
                        'secemail': secemail,
                        'title': title,
                        'category': category,
                        'condition': condition,
                        'link': link,
                        'price': price,
                        'age': age,
                        'affordability': affordability,
                        'description': desc,
                      },
                    );
                    Navigator.pushNamed(context, TabsScreen.id);
                  } catch (e) {
                    showAlertDialog(context);
                  }
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'SELL !!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget logOutButton = TextButton(
    child: Text("Try Again"),
    onPressed: () {
      Navigator.pushNamed(context, SellerScreen.routeName);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Oops! Looks like your product didn't go through!"),
    content: Text("Please check to ensure all fields have been selected"),
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
