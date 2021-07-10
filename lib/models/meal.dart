import 'dart:ffi';

import 'package:flutter/foundation.dart';

enum Condition {
  Mint,
  Slightly_Used,
  Worn_Out,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> description;
  final double price;
  final int age;
  final Condition condition;
  final Affordability affordability;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.age,
    required this.affordability,
    required this.condition,
  });
}
