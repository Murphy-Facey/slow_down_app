import 'dart:convert';

import "package:slow_down_app/models/article_model.dart";
import "package:http/http.dart" as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    Uri url = Uri.parse("https://jis-transport-news-api.herokuapp.com/news");

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData != null) {
      jsonData.forEach((article) {
        ArticleModel articleModel = ArticleModel(
          title: article["title"],
          datePublished: article["date_published"],
          imageUrl: article["image_url"] != null ? article["image_url"] : "NO IMAGE",
          summary: article["summary"],
          url: article["url"],
        );

        news.add(articleModel);
      });
    }
  }



}