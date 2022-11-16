import 'dart:convert';
import 'package:apiapp/models/exercises_model.dart';
import "package:http/http.dart" as http;

class RemoteService {
  Future<List<Post>?> getPosts({String? searchQuery}) async {
    String? searchQueryTemp = "";
    if(searchQuery != null || searchQuery != ""){
      searchQueryTemp = searchQuery;
    }
    var uri = Uri.https("exercises-by-api-ninjas.p.rapidapi.com",
        "/v1/exercises", {
          "name": searchQueryTemp, 
          "type": '', 
          "muscle": '', 
          "difficulty": ''
        });
    var res = await http.get(uri, headers: {
      'X-RapidAPI-Key': '0b6eb34ca7msh9bc50e702ba0f7ap1112f6jsnf997a368fd08',
      'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
    }
    
    
    );
    if (res.statusCode == 200) {
      var json = res.body;
      return postFromJson(json);       
    } else {
    }
  }
}
