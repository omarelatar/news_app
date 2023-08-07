// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:newsy/helper/news.dart';
import 'package:newsy/models/article_model.dart';
import 'package:newsy/widget/widgets.dart';

class CategoryNews extends StatefulWidget {
  final String? category;

  const CategoryNews({super.key, this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> article = [];
  bool _isLoading = true;
  @override
  void initState() {

    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category!);
    article = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "News",
              style: TextStyle(
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      // ignore: prefer_const_constructors
      body: _isLoading? Center(child: CircularProgressIndicator(),):  Container(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: article.length,
          itemBuilder: (context, index) {
            return ArticleItem(
              imageUrl: article [index].imageToUrl,
              title: article [index].title,
              description: article [index].description,
              url: article [index].url,
            );
          },
        ),
      ),
    );
  }
}
