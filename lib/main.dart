import 'package:flutter/material.dart';
import 'package:flutter_book_task/views/book_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: ' Book List', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)), home: BookList());
  }
}
