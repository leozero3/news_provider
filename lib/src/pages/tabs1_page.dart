import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_services.dart';
import 'package:news_provider/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsServices>(context).headlines;

    return Scaffold(
      body: ListNews(headlines)
    );
  }
}
