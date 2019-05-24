import 'package:flutter/material.dart';
import 'package:flutter_news_reader/NewsHomePage.dart';

void main() => runApp(NewsReaderApp());

class NewsReaderApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News Reader',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NewsHomePage(title: 'News Reader'),
    );
  }
}