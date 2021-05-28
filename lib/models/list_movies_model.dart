


class Movies {
  final List<dynamic> movies;
  Movies({this.movies});
  factory Movies.fromJson(Map<String, dynamic> jsonData) {
    return Movies(movies: jsonData['results']);
  }
}
