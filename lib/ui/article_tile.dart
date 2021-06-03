import 'dart:ui';

import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final String imageUrl, title, summary, date;
  ArticleTile(
      {this.imageUrl,
      @required this.title,
      @required this.summary,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (imageUrl != "NO IMAGE")
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.contain,
              )
            ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.0,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14.0,
              color: Colors.red[600]
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Text(
              summary,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.0
              ),
            ),
          )
        ],
      )
    );
  }
}
