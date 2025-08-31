import 'package:first_flutter/main.dart';
import 'package:flutter/material.dart';

class Quote {
  String? author;
  String? snippet;

  Quote({ String? authorArg, String? snippetArg }) {
    author = authorArg;
    snippet = snippetArg;
  }


  Card getQuote() {
    return Card(
      // margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(snippet ?? "--No quote available--"),
            SizedBox(height: 5.0),
            Text(author ?? "Unknown author")
          ],
        ),
      ),
    );
  }



}
