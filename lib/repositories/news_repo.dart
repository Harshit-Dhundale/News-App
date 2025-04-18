import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/article_model.dart';

class NewsRepository {
  Future<List<ArticleModel>> fetchNews( String countryCode) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=${countryCode}&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _artcileModel = ArticleModel.fromJson(item);
        _articleModelList.add(_artcileModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList; // empty list
    }
  }
}