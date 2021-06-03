import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:slow_down_app/models/article_model.dart';
import 'package:slow_down_app/models/authentication_model.dart';
import 'package:slow_down_app/models/news.dart';
import 'package:slow_down_app/ui/article_tile.dart';

class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() => DashboardScreenState();
}


class DashboardScreenState extends State<DashboardScreen> {
  List<ArticleModel> _articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        "Good Day, ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "John",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0)),
                          backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                        ),
                        onPressed: () {
                          context.read<AuthenticateModel>().signOut();
                        },
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16.0,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        )
                      )
                    ],
                  ),
                ),
                height: 100.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5.0,
                      blurRadius: 10.0,
                      offset: Offset(0, 0)
                    )]
                  ),
                  child: _loading ? Center(
                    child: CircularProgressIndicator(),
                  ) : Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(bottom: 20.0, left: 25.0),
                        child: Text(
                          "Latest Transport News",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.red[600]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _articles.length,
                            itemBuilder: (context, index) {
                              return ArticleTile(
                                title: _articles[index].title,
                                summary: _articles[index].summary,
                                date: _articles[index].datePublished,
                                imageUrl: _articles[index].imageUrl,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              )],
          )
        ),
    );
  }
}