import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_detail.dart';
import '../../domain/repository/movie_repository.dart';
import 'package:movie_infp_app/data/data_source/movie_data_sourece.dart';
import '../dto/movie_dto.dart';
import 'package:movie_infp_app/data/dto/movie_datail_dto.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(this.movieDataSource);

  @override
  Future<List<Movie>> getMovies({bool fromJson = false}) async {
    try {
      List<MovieDto> movieDtos;
      if (fromJson) {
        // JSON 파일에서 영화 데이터를 가져오기
        movieDtos = await movieDataSource.fetchMoviesFromJson();
      } else {
        // API를 통해 영화 데이터를 가져오기
        movieDtos = await movieDataSource.fetchMovies();
      }

      return movieDtos
          .map((dto) => Movie(
                id: dto.id, // id 매개변수 추가
                title: dto.title,
                releaseDate: dto.releaseDate,
                overview: dto.overview,
                rating: dto.rating,
                posterPath: dto.posterPath,
              ))
          .toList();
    } catch (e) {
      print('Error fetching movies: $e');
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      // 영화 상세 정보를 가져오기
      final MovieDetailDto movieDetailDto =
          await movieDataSource.fetchMovieDetail(movieId);
      return MovieDetail(
        id: movieDetailDto.id,
        title: movieDetailDto.title,
        releaseDate: movieDetailDto.releaseDate,
        overview: movieDetailDto.overview,
        rating: movieDetailDto.rating,
        runtime: movieDetailDto.runtime,
        director: movieDetailDto.director,
        genres: movieDetailDto.genres,
        posterPath: movieDetailDto.posterPath,
        backdropPath: movieDetailDto.backdropPath,
        boxOffice: movieDetailDto.boxOffice, // 흥행 정보 추가
      );
    } catch (e) {
      print('Error fetching movie detail: $e');
      throw Exception('Failed to load movie detail');
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      List<MovieDto> movieDtos = await movieDataSource.fetchPopularMovies();
      return movieDtos
          .map((dto) => Movie(
                id: dto.id, // id 매개변수 추가
                title: dto.title,
                releaseDate: dto.releaseDate,
                overview: dto.overview,
                rating: dto.rating,
                posterPath: dto.posterPath,
              ))
          .toList();
    } catch (e) {
      print('Error fetching popular movies: $e');
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    try {
      List<MovieDto> movieDtos = await movieDataSource.fetchTopRatedMovies();
      return movieDtos
          .map((dto) => Movie(
                id: dto.id, // id 매개변수 추가
                title: dto.title,
                releaseDate: dto.releaseDate,
                overview: dto.overview,
                rating: dto.rating,
                posterPath: dto.posterPath,
              ))
          .toList();
    } catch (e) {
      print('Error fetching top rated movies: $e');
      throw Exception('Failed to load top rated movies');
    }
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    try {
      List<MovieDto> movieDtos = await movieDataSource.fetchUpcomingMovies();
      return movieDtos
          .map((dto) => Movie(
                id: dto.id, // id 매개변수 추가
                title: dto.title,
                releaseDate: dto.releaseDate,
                overview: dto.overview,
                rating: dto.rating,
                posterPath: dto.posterPath,
              ))
          .toList();
    } catch (e) {
      print('Error fetching upcoming movies: $e');
      throw Exception('Failed to load upcoming movies');
    }
  }
}
