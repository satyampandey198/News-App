import 'dart:convert';

import 'package:newsapp/model/artical_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news=[];
 
 
  Future<void> getNews()async{
    String url="https://newsapi.org/v2/everything?q=apple&from=2024-09-12&to=2024-09-12&sortBy=popularity&apiKey=0262b465aeb740e397700ab8ff6b7945";
    // ignore: unused_local_variable
    var response= await http.get(Uri.parse(url) );

    var jsonData= jsonDecode(response.body);

    if(jsonData ["status"]=="ok"){
    jsonData['articles'].forEach((element){
      if(element["urlToImage"]!=null && element["description"]!=null ){
        ArticleModel articleModel=ArticleModel(
          title: element["title"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
          author: element["author"],
        );
        news.add(articleModel);
      }

    });

    }


  }
}