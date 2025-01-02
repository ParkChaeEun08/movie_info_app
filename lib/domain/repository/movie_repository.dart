import '../entity/movie.dart';
import '../entity/movie_detail.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
}
