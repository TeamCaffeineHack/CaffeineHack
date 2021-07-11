import 'package:flutter/material.dart';
import 'package:the_second_chapter/mybooks_screen.dart';
import 'package:the_second_chapter/screens/category_books_screen.dart';
import 'package:the_second_chapter/screens/tabs_screen.dart';
import '../charities.dart';
import '../screens/charity_screen.dart';
import '../screens/seller_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.amber,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'WELCOME!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Buy Books',
            Icons.book,
            () {
              Navigator.pushNamed(context, TabsScreen.id);
            },
          ),
          buildListTile(
            'Sell Books',
            Icons.sell,
            () {
              Navigator.pushNamed(context, SellerScreen.routeName);
            },
          ),
          buildListTile(
            'Charity',
            Icons.favorite,
            () {
              Navigator.pushNamed(context, Charities.id);
            },
          ),
          buildListTile(
            'My Sold Books',
            Icons.book,
            () {
              Navigator.pushNamed(context, MyBooks.id);
            },
          ),
        ],
      ),
    );
  }
}
