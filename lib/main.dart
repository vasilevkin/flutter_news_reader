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
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white54),
              subhead: TextStyle(
                fontSize: 10.0,
              ),
              title: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              subtitle: TextStyle(
                fontSize: 11.0,
                fontStyle: FontStyle.italic,
              ),
              body1: TextStyle(
                fontSize: 11.0,
              ),
              body2: TextStyle(
                fontSize: 10.0,
              ),
              button: TextStyle(
                fontSize: 11.0,
              ),
            ),
      ),
      home: NewsHomePage(title: 'News Reader'),
    );
  }
}
