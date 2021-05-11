import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a62b7f1ebaa041ada02cd5f383a9156c';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];

  NewsServices() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=br';

    final resp = await http.get(url);

    final newsReponse = newsResponseFromJson( resp.body);

    this.headlines.addAll( newsReponse.articles);

    notifyListeners();


  }
}
