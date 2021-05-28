import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instabug_moviesapp/models/movie_model.dart';
import 'package:instabug_moviesapp/models/list_movies_model.dart';


class MovieApi {
  final String apiKey = '28ca791e2e6ea8305e91ee3b844a5490';

  Future<List<Movie>> fetchMovies() async {
    List<Movie> finalData;
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate'));


      if (response.statusCode == 200) {
        String data = response.body; //still string
        var jsonData = jsonDecode(data);
        //converted to json but data still unknown
        Movies articless = Movies.fromJson(jsonData);
        //articlesss known as list but list of dynamic
        List<Movie> articlesList =
            articless.movies.map((e) => Movie.fromJson(e)).toList();
        //each article in artcles stored in articlesList
        finalData =  articlesList;
      } else {
        print('status code= ${response.statusCode}');
      }
    } catch (ex) {
      throw ex;
    }
    return finalData;
  }
}
