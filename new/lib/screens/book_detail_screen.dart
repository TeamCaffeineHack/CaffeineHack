import 'package:flutter/material.dart';

import '../dummy_data.dart';

class BookDetailScreen extends StatelessWidget {
  static const routeName = '/book-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      // color: Color.fromRGBO(24, 24, 24, 1),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(24, 24, 24, 1),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedBook = DUMMY_BOOKS.firstWhere((book) => book.id == bookId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedBook.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedBook.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Description', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedBook.description[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                itemCount: selectedBook.description.length,
              ),
            ),
            buildSectionTitle('Price', context),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(24, 24, 24, 1),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 50,
              width: 200,
              child: Text(
                'Rs. ${selectedBook.price.toString()}',
                // style: Theme.of(context).textTheme.bodyText1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: null,
      ),
    );
  }
}
