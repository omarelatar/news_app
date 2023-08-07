import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

//data of Articles
class News {

  List<ArticleModel> news = [];
  Future<void> getNews () async{

    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=28e3a2a2671f4028949796c4a8d37834';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element){
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            author: element["author"],
            url: element["url"],
            imageToUrl: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });

    }

  }

}
//data og category
class CategoryNewsClass {

  List<ArticleModel> news = [];
  Future<void> getNews (String category) async{

    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=28e3a2a2671f4028949796c4a8d37834';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element){
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            author: element["author"],
            url: element["url"],
            imageToUrl: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });

    }

  }

}