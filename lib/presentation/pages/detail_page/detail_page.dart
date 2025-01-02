import 'package:flutter/material.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_detail.dart';
import 'package:movie_infp_app/data/repository/movie_repository_impl.dart';
import 'package:movie_infp_app/data/data_source/remote_data_source.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  Future<MovieDetail> fetchMovieDetail() async {
    final repository = MovieRepositoryImpl(RemoteDataSource());
    return await repository.getMovieDetail(movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: FutureBuilder<MovieDetail>(
        future: fetchMovieDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load movie detail'));
          } else {
            final movieDetail = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'movie_${movie.title}',
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Text('이미지를 불러올 수 없습니다.');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      movieDetail.overview,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Release Date: ${movieDetail.releaseDate}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Rating: ${movieDetail.rating}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Box Office: \$${movieDetail.boxOffice != 0.0 ? movieDetail.boxOffice.toStringAsFixed(2) : "N/A"}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
