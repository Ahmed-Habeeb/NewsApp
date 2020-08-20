import 'dart:convert';

import 'package:basicapp/api/stings.dart';
import 'package:basicapp/modules/article.dart';
import 'package:http/http.dart' as http;



class fetchdata{
  Future<List<Article>> fetchheadlinesdata()async{
    List<Article> aricales=List<Article>();
    String api=Base_url+topheadlines_eg+api_key;
    var response= await http.get(api);
    if (response.statusCode==200){
      var jsondata=jsonDecode(response.body);
      var data=jsondata["articles"];
      for (var item in data){
        Article article= Article(author: item["author"],content: item["content"],description: item["description"],imageurl: item["urlToImage"],
        puplishedat: item["publishedAt"],title:item["title"],url: item["url"] );
        aricales.add(article);
      }
    }
    return aricales;
  }
  Future<List<Article>>fetchcategory(String category)async{
    List<Article> articales=List<Article>();
    String api=Base_url+topheadlines_eg+category+api_key;
    var response= await http.get(api);
    if (response.statusCode==200){
      var jsondata=jsonDecode(response.body);
      var data=jsondata["articles"];
      for (var item in data){
        Article article= Article(author: item["author"],content: item["content"],description: item["description"],imageurl: item["urlToImage"],
            puplishedat: item["publishedAt"],title:item["title"],url: item["url"] );
        articales.add(article);
      }
    }
    return articales;
  }

}
