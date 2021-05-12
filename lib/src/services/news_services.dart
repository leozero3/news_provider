import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a62b7f1ebaa041ada02cd5f383a9156c';

// class NewsServices with ChangeNotifier {
//   List<Article> headlines = [];
//   String _selectedCategory = 'business';
//
//   bool _isLoading = true;
//   bool get isLoading => _isLoading;
//
//   String get selectedCategory => _selectedCategory;
//
//   set selectedCategory(String value) {
//     _selectedCategory = value;
//     _isLoading = true;
//     getArticlesByCategory(value);
//
//     notifyListeners();
//   }
//
//   List<Article> get getArticlesCategorySelected => categoryArticle[selectedCategory];
//
//   List<Category> categories = [
//     Category(FontAwesomeIcons.building, 'business'),
//     Category(FontAwesomeIcons.tv, 'entertainment'),
//     Category(FontAwesomeIcons.addressCard, 'general'),
//     Category(FontAwesomeIcons.headSideVirus, 'health'),
//     Category(FontAwesomeIcons.vial, 'science'),
//     Category(FontAwesomeIcons.volleyballBall, 'sports'),
//     Category(FontAwesomeIcons.memory, 'technology'),
//   ];
//
//   Map<String, List<Article>> categoryArticle = {};
//
//   NewsServices() {
//     this.getTopHeadlines();
//
//     categories.forEach((item) {
//       categoryArticle[item.name] = [];
//     });
//   }
// ///=============================================================================
//   getTopHeadlines() async {
//     final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=br';
//
//     final resp = await http.get(url);
//
//     final newsReponse = newsResponseFromJson(resp.body);
//
//     this.headlines.addAll(newsReponse.articles);
//
//     notifyListeners();
//   }
//
//   ///===========================================================================
//   getArticlesByCategory(String category) async {

//     if (categoryArticle[category].length > 0) {
//       _isLoading = false;
//       notifyListeners();
//       return categoryArticle[category];
//     }
//
//     final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=br&category=$category';
//     final resp = await http.get(url);
//
//     final newsReponse = newsResponseFromJson(resp.body);
//
//     this.categoryArticle[category].addAll(newsReponse.articles);
//
//     _isLoading = false;
//     notifyListeners();
//   }
// }
class NewsServices with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'  ),
    Category( FontAwesomeIcons.tv, 'entertainment'  ),
    Category( FontAwesomeIcons.addressCard, 'general'  ),
    Category( FontAwesomeIcons.headSideVirus, 'health'  ),
    Category( FontAwesomeIcons.vials, 'science'  ),
    Category( FontAwesomeIcons.volleyballBall, 'sports'  ),
    Category( FontAwesomeIcons.memory, 'technology'  ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsServices() {
    getTopHeadlines();

    categories.forEach( (item) {
      categoryArticles[item.name] = [];
    });

    getArticlesByCategory( _selectedCategory );
  }

  bool get isLoading => _isLoading;


  get selectedCategory => _selectedCategory;
  set selectedCategory( String valor ) {
    _selectedCategory = valor;

    _isLoading = true;
    getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article> get getArticlesCategorySelected => categoryArticles[ selectedCategory ];



  getTopHeadlines() async {

    final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=br';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body );

    headlines.addAll( newsResponse.articles );
    notifyListeners();
  }

  getArticlesByCategory( String category ) async {

    if ( categoryArticles[category].length > 0 ) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles[category];
    }

    final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=br&category=$category';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body );

    categoryArticles[category].addAll( newsResponse.articles );

    _isLoading = false;
    notifyListeners();
  }
}
