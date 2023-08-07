// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:newsy/helper/data.dart';
import 'package:newsy/helper/news.dart';
import 'package:newsy/models/article_model.dart';
import 'package:newsy/widget/widgets.dart';

import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories().cast<CategoryModel>();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              "News",
              style: TextStyle(
                fontSize: 25,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(

          child: SingleChildScrollView(
            child: Column(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 80,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        categoryName: categories[index].categoryName,
                        imageUrl: categories[index].imageUrl,
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return ArticleItem(
                        imageUrl: articles[index].imageToUrl,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
