import 'package:flutter/material.dart';

import 'package:flutter_news_reader/DetailsPage.dart';

class NewsItem extends StatelessWidget {
  final String sourceId;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const NewsItem(
      {Key key,
      this.sourceId,
      this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content})
      : super(key: key);

  Widget _articleText(text, TextStyle style) {
    String formattedText = "n/a";
    if (text != null) {
      formattedText = text;
    }
    return Text(formattedText, style: style);
  }

  Widget _articleImage(imageUrl) {
    if (imageUrl != null) {
      return Image.network(imageUrl);
    } else {
      return Placeholder(
        fallbackWidth: 100,
        fallbackHeight: 100,
      );
    }
  }

  Widget _articleDate(String textDate, TextStyle style) {
    String formattedText = "n/a";
    if (textDate != null) {
      formattedText = textDate.substring(0, 10);
    }
    return Text(formattedText, style: style);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _articleText(sourceName, textTheme.subhead),
                _articleDate(publishedAt, textTheme.body2),
              ],
            ),
            Column(
              children: <Widget>[
                _articleText(title, textTheme.title),
                _articleImage(urlToImage),
              ],
            ),
            _articleText(description, textTheme.subtitle),
            ExpansionTile(
              title: Text("more..."),
              children: <Widget>[
                _articleText(content, textTheme.body1),
                RaisedButton(
                    child: Text("Read full"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(url)));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
