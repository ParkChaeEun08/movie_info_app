import '../repository/movie_repository.dart';
import '../entity/movie.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
