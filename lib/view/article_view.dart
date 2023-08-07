// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? blogUrl;

  const ArticleView({super.key, this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

 final Completer<WebViewController>_completer = Completer<WebViewController>();

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
            const Text(
              "Flutter",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const Text(
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
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
