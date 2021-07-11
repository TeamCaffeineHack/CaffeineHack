import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SellerScreen extends StatelessWidget {
  static const routeName = '/sellers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sellers'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
