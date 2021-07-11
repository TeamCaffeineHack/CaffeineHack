import 'package:flutter/material.dart';
import '../widgets/book_item.dart';
import '../dummy_data.dart';
import '../models/book.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_second_chapter/models/category.dart';

final _firestore = FirebaseFirestore.instance;
List<BookDetail> cards = [];

late String email;

class ViewBooks extends StatefulWidget {
  static const id = 'ViewBooks';

  @override
  _ViewBooksState createState() => _ViewBooksState();
}

class _ViewBooksState extends State<ViewBooks> {
  List<dynamic> displayedBook = [];
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      email = ModalRoute.of(context)!.settings.arguments as String;
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOOKS SOLD BY YOU!'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MessagesStream();
        },
        itemCount: 1,
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Sellerdetails').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white70,
            ),
          );
        }
        final messages = snapshot.data!.docChanges;
        cards = [];
        for (var message in messages) {
          final imageUrl = message.doc['link'];
          final affordability = message.doc['affordability'];
          final condition = message.doc['condition'];
          final duration = message.doc['age'];
          final title = message.doc['title'];
          final category = message.doc['category'];
          final description = message.doc['description'];
          final price = message.doc['price'];
          final secemail = message.doc['secemail'];

          final BookCard = BookDetail(
            price: price,
            description: description,
            title: title,
            imageUrl: imageUrl,
            affordability: affordability,
            condition: condition,
            duration: duration,
            secemail: secemail,
          );
          if (secemail == email) cards.add(BookCard);
          print(cards.length);
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
