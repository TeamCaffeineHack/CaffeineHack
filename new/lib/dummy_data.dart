import 'package:flutter/material.dart';

import './models/category.dart';
import './models/book.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Reference Books',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'CBSE Textbooks',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Notes',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'State Board Books',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Comedy',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Action',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Non-Fiction',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Mystery',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Biography',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Miscellaneous',
    color: Colors.teal,
  ),
];

const DUMMY_BOOKS = const [
  Book(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'RD Sharma Class 10',
    affordability: Affordability.Affordable,
    condition: Condition.Mint,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/613fNwtzebL.jpg',
    age: 2,
    description: [
      'Description goes here',
    ],
    price: 400.00,
  ),
  Book(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'CBSE Class 10 Science Book',
    affordability: Affordability.Affordable,
    condition: Condition.Slightly_Used,
    imageUrl:
        'https://qph.fs.quoracdn.net/main-qimg-ded55adda6992f246b5ca1e5e398ddfa',
    age: 10,
    description: [
      'Description goes here',
    ],
    price: 200.00,
  ),
  Book(
    id: 'm3',
    categories: [
      'c3',
    ],
    title: 'Physics Notes - Electromagnetism Class 10',
    affordability: Affordability.Affordable,
    condition: Condition.Worn_Out,
    imageUrl:
        'https://1.bp.blogspot.com/-NXjsp515PDw/XwrT1mhDPYI/AAAAAAAAHB0/lK6ehKgWmhQMm81nFbxUENG8us8nyRe3wCLcBGAsYHQ/d/Electromagnetic%2Bwaves_1.jpg',
    age: 4,
    description: [
      'Description goes here',
    ],
    price: 200.00,
  ),
  Book(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Class 12 Chemistry Textbook',
    affordability: Affordability.Pricey,
    condition: Condition.Slightly_Used,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/71q1SX8eefL.jpg',
    age: 12,
    description: [
      'Description goes here',
    ],
    price: 200.00,
  ),
];
