import 'package:flutter/material.dart';
import '../widgets/book_item.dart';
import '../dummy_data.dart';
import '../models/book.dart';

class CategoryBooksScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryBooksScreenState createState() => _CategoryBooksScreenState();
}

class _CategoryBooksScreenState extends State<CategoryBooksScreen> {
  String categoryTitle = "";
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
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedBook = DUMMY_BOOKS.where((book) {
        return book.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedBook.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return BookDetail(
            id: displayedBook[index].id,
            title: displayedBook[index].title,
            affordability: displayedBook[index].affordability,
            condition: displayedBook[index].condition,
            duration: displayedBook[index].age,
            imageUrl: displayedBook[index].imageUrl,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedBook.length,
      ),
    );
  }
}
