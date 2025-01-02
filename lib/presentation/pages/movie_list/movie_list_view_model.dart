import '../../../domain/usecase/get_movies.dart';
import '../../../domain/usecase/get_popular_movies.dart';
import '../../../domain/usecase/get_top_rated_movies.dart';
import '../../../domain/usecase/get_upcoming_movies.dart';
import '../../../domain/entity/movie.dart';
import '../../../data/repository/movie_repository_impl.dart';
import '../../../data/data_source/remote_data_source.dart';

class MovieListViewModel {
  final GetMovies getMoviesUseCase;
  final GetPopularMovies getPopularMoviesUseCase;
  final GetTopRatedMovies getTopRatedMoviesUseCase;
  final GetUpcomingMovies getUpcomingMoviesUseCase;

  MovieListViewModel()
      : getMoviesUseCase = GetMovies(MovieRepositoryImpl(RemoteDataSource())),
        getPopularMoviesUseCase =
            GetPopularMovies(MovieRepositoryImpl(RemoteDataSource())),
        getTopRatedMoviesUseCase =
            GetTopRatedMovies(MovieRepositoryImpl(RemoteDataSource())),
        getUpcomingMoviesUseCase =
            GetUpcomingMovies(MovieRepositoryImpl(RemoteDataSource()));

  Future<List<Movie>> getMovies() async {
    return await getMoviesUseCase();
  }

  Future<List<Movie>> getPopularMovies() async {
    return await getPopularMoviesUseCase();
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return await getTopRatedMoviesUseCase();
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return await getUpcomingMoviesUseCase();
  }
}
