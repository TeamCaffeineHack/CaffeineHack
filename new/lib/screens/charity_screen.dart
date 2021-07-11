import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class CharityScreen extends StatelessWidget {
  static const routeName = '/charity-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charitable Organizations'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
