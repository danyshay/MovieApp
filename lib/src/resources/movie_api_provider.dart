import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {

  Client client = Client();
  final _api_key = '802b2c4b88ea1183e50e6b285a27696e';

  Future <ItemModel> fetchMovieList () async{
    print("Fetching movie list");
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_api_key");
    print(response.body.toString());
    print("Original");
    print(response.body);
    if(response.statusCode == 200){
      return ItemModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to load data");
    }

  }
}