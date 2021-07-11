import 'package:flutter/material.dart';
import 'package:the_second_chapter/welcome_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static String id = 'tabs_screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Your Favourites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        actions: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen.id);
              },
              child: Icon(
                Icons.close,
                color: Colors.grey,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.favorite_sharp),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
