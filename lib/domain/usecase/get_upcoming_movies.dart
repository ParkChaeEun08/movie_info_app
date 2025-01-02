import '../repository/movie_repository.dart';
import '../entity/movie.dart';

class GetUpcomingMovies {
  final MovieRepository repository;

  GetUpcomingMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getUpcomingMovies();
  }
}
