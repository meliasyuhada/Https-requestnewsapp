import 'dart:convert';
import 'package:request_newsapp/model/article_model.dart';
import'package:http/http.dart';



class ApiService {
  
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6a9798f1c77a4ad39d4fd0322edfecf5";


  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}