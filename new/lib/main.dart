import 'package:flutter/material.dart';
import 'package:the_second_chapter/charities.dart';
import 'package:the_second_chapter/charity_screen.dart';
import 'package:the_second_chapter/registration_screen.dart';
import 'package:the_second_chapter/screens/book_detail_screen.dart';
import 'package:the_second_chapter/screens/category_books_screen.dart';
import 'package:the_second_chapter/screens/seller_screen.dart';
import 'package:the_second_chapter/screens/tabs_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';
import 'buyer_seller_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SecondChapter());
}

class SecondChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.tealAccent,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        BuyerSellerScreen.id: (context) => BuyerSellerScreen(),
        CharityScreen.id: (context) => CharityScreen(),
        Charities.id: (context) => Charities(),
        TabsScreen.id: (context) => TabsScreen(),
        CategoryBooksScreen.routeName: (context) => CategoryBooksScreen(),
        BookDetailScreen.routeName: (context) => BookDetailScreen(),
        SellerScreen.routeName: (context) => SellerScreen(),
      },
    );
  }
}
