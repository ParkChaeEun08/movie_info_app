class MovieDetail {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final double rating;
  final int runtime;
  final String director;
  final List<String> genres;
  final String posterPath;
  final String backdropPath;
  final double boxOffice;

  MovieDetail({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.rating,
    required this.runtime,
    required this.director,
    required this.genres,
    required this.posterPath,
    required this.backdropPath,
    required this.boxOffice,
  });
}
