class Movie {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  Movie({this.title, this.description, this.imageUrl,this.date});

  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(
        title: jsonData['title'],
        description: jsonData['overview'],
        imageUrl: jsonData['poster_path'],
        date : jsonData['release_date']);
  }
}
