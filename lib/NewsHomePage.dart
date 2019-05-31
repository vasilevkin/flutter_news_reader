import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_news_reader/widgets/NewsItem.dart';

class NewsHomePage extends StatefulWidget {
  NewsHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  final List<NewsItem> _items = <NewsItem>[];
  var _responseBody;
  bool _isLoading = true;

  static const String apiKey = "c89e0acaf086411eb6c1745a9c7ff077";
  static const String newsEndPoint = "https://newsapi.org/v2/";

  String topHeadlinesUrl() =>
      newsEndPoint + "top-headlines?country=us&category=";

  @override
  void initState() {
    _fetchNewsInfo('');
    super.initState();
  }

  _fetchNewsInfo(String category) async {
    var result = await http.get(Uri.encodeFull(topHeadlinesUrl() + category),
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "c89e0acaf086411eb6c1745a9c7ff077"
        });
    _responseBody = json.decode(result.body);
    if (_responseBody['status'] == 'ok') {
      _items.clear();

//      print(_responseBody['articles']);

      for (var article in _responseBody['articles']) {
//        print(article);

        _items.add(NewsItem(
          sourceId: article['source']['id'],
          sourceName: article['source']['name'],
          author: article['author'],
          title: article['title'],
          description: article['description'],
          url: article['url'],
          urlToImage: article['urlToImage'],
          publishedAt: article['publishedAt'],
          content: article['content'],
        ));
      }

      setState(() {
        _isLoading = false;

//        print("setState: data is loaded");
      });
    } else {
      print("Response error:" + _responseBody);
    }
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            itemBuilder: (_, int index) => _items[index],
            itemCount: _items.length,
          )),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildBody(),
      ),
    );
  }
}
