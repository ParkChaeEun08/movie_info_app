import '../repository/movie_repository.dart';
import '../entity/movie.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getTopRatedMovies();
  }
}
