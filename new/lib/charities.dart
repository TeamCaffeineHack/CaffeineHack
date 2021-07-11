import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class Charities extends StatefulWidget {
  static String id = 'charities';

  @override
  _CharitiesState createState() => _CharitiesState();
}

class _CharitiesState extends State<Charities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
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
                Text(
                  'The Second Chapter',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Otomanopee',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'Charitable Organisations :',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Otomanopee',
                color: Colors.white60,
              ),
            ),
            MessagesStream(),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('charityinfo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white70,
            ),
          );
        }
        final messages = snapshot.data!.docChanges;
        List<InformationCard> cards = [];
        for (var message in messages) {
          final email = message.doc['email'];
          final aboutUs = message.doc['aboutUs'];

          final InfoCard = InformationCard(
            email: email,
            aboutUs: aboutUs,
          );

          cards.add(InfoCard);
        }
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cards,
            ),
          ),
        );
      },
    );
  }
}

class InformationCard extends StatelessWidget {
  InformationCard({required this.email, required this.aboutUs});

  final String email;
  final String aboutUs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              trailing: Text(
                email,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: SizedBox(
              height: 200.0,
              child: ListTile(
                leading: Icon(
                  Icons.article_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                subtitle: Text(
                  aboutUs,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white60,
            height: 30,
            thickness: 6,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
