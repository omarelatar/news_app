
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsy/view/article_view.dart';
import 'package:newsy/view/category_news.dart';

class CategoryItem extends StatelessWidget {
  final String? categoryName;
  final String? imageUrl;

  const CategoryItem({super.key, this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryNews(
            category: categoryName!. toLowerCase(),
        ),
        ),
        );
      } ,
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              height: 80,
              width: 120,
              child: Text(
                categoryName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final String? imageUrl, title, description, url;

  const ArticleItem(
      {super.key, this.imageUrl, this.title, this.description, this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // ignore: prefer_const_constructors
       Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(
         blogUrl: url,
       )),);
      },
      child: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(imageUrl!),
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            Text(
              description!,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
