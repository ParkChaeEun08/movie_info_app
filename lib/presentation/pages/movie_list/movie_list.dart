import 'package:flutter/material.dart';
import '../../../domain/entity/movie.dart';
import 'movie_list_view_model.dart';
import 'package:movie_infp_app/presentation/pages/detail_page/detail_page.dart';

class MovieListPage extends StatelessWidget {
  final MovieListViewModel viewModel = MovieListViewModel();

  MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null, // 제목을 제거
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<List<Movie>>>(
          future: Future.wait([
            viewModel.getMovies(),
            viewModel.getPopularMovies(),
            viewModel.getTopRatedMovies(),
            viewModel.getUpcomingMovies(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load movies'));
            } else {
              final allMovies = snapshot.data!;
              final movies = allMovies[0];
              final popularMovies = allMovies[1];
              final topRatedMovies = allMovies[2];
              final upcomingMovies = allMovies[3];
              final featuredMovie = movies.first;
              final remainingMovies = movies.sublist(1);

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildFeaturedMovie(context, featuredMovie),
                    const SizedBox(height: 20),
                    buildCategoryList(context, '현재 상영중', remainingMovies),
                    const SizedBox(height: 20),
                    buildCategoryList(context, '인기순', popularMovies),
                    const SizedBox(height: 20),
                    buildCategoryList(context, '평점 높은 순', topRatedMovies),
                    const SizedBox(height: 20),
                    buildCategoryList(context, '개봉 예정', upcomingMovies),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildFeaturedMovie(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie: movie),
          ),
        );
      },
      child: Hero(
        tag: 'movie_${movie.title}',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '가장 인기있는',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text('이미지를 불러올 수 없습니다.');
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryList(
      BuildContext context, String label, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(movie: movie),
                    ),
                  );
                },
                child: Hero(
                  tag: 'movie_${movie.title}',
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          errorBuilder: (context, error, stackTrace) {
                            return Text('이미지를 불러올 수 없습니다.');
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
