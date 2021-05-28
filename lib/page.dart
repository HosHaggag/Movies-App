import 'package:flutter/material.dart';
import 'package:instabug_moviesapp/services/moviesServices.dart';

import 'models/movie_model.dart';

class Pagedate extends StatefulWidget {
  @override
  _PagedateState createState() => _PagedateState();
}

class _PagedateState extends State<Pagedate> {
  Future<List<Movie>> futureData;
  MovieApi movieApi = MovieApi();

  @override
  void didChangeDependencies() {
    futureData = movieApi.fetchMovies();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, count) {
                      return MovieItem(title: snapshot.data[count].title,overView: snapshot.data[count].description, imageUrl: 'https://image.tmdb.org/t/p/original/${snapshot.data[count].imageUrl}',date: snapshot.data[count].date,);
                    });
              } else if (snapshot.hasError){
                return Text('Error Found');
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}

class MovieItem extends StatelessWidget {
  final String title , overView , imageUrl , date;

MovieItem({this.title , this.imageUrl , this.overView , this.date});



  @override
  Widget build(BuildContext context) {
        return Expanded(
                  child: Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20)),
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: double.infinity,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              overView,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 12,
                              style: TextStyle(fontSize: 16),
                            ),
                          )),SizedBox(
                        height: 5,
                      ),Text('realease in $date'),SizedBox(
                        height: 5,
                      )
                ],
              ),
            )
          ],
      ),
    ),
        );
  }
}
