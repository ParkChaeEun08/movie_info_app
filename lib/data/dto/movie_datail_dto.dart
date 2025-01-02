class MovieDetailDto {
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

  MovieDetailDto({
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

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      rating: (json['vote_average'] as num).toDouble(),
      runtime: json['runtime'],
      director: (json['director'] ?? 'Unknown') as String,
      genres: List<String>.from(json['genres'].map((genre) => genre['name'])),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      boxOffice:
          json['revenue'] != null ? (json['revenue'] as num).toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'overview': overview,
      'vote_average': rating,
      'runtime': runtime,
      'director': director,
      'genres': genres,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'revenue': boxOffice,
    };
  }
}
