import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class NewsServices with ChangeNotifier {

  List<Article> headlines = [];

  NewsServices(){

    this.getTopHeadlines();
  }


  getTopHeadlines(){
    print('carregando');
  }









}