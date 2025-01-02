import '../dto/movie_dto.dart';
import 'package:movie_infp_app/data/dto/movie_datail_dto.dart';

abstract class MovieDataSource {
  Future<List<MovieDto>> fetchMovies();
  Future<List<MovieDto>> fetchMoviesFromJson();
  Future<MovieDetailDto> fetchMovieDetail(int movieId);
  Future<List<MovieDto>> fetchPopularMovies();
  Future<List<MovieDto>> fetchTopRatedMovies();
  Future<List<MovieDto>> fetchUpcomingMovies();
}
