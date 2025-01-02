import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import '../dto/movie_dto.dart';
import 'package:movie_infp_app/data/dto/movie_datail_dto.dart';
import 'package:movie_infp_app/data/data_source/movie_data_sourece.dart';

class RemoteDataSource implements MovieDataSource {
  @override
  Future<List<MovieDto>> fetchMovies() async {
    final String? apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print('Error: API_KEY is not set in .env file');
      throw Exception('API_KEY is not set');
    }

    final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';

    try {
      final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

      print('Response body: ${response.body}'); // 응답 본문 출력

      if (response.statusCode == 200) {
        List<dynamic> results = json.decode(response.body)['results'];
        print('Results: $results'); // 결과 리스트 출력

        return results.map((movie) {
          print('Movie JSON: $movie'); // 각 영화 객체 출력
          return MovieDto.fromJson(movie);
        }).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        print('Response body: ${response.body}'); // 오류 응답 본문 출력
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieDto>> fetchMoviesFromJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/movie.json');
      final List<dynamic> data = json.decode(response);

      return data.map((json) => MovieDto.fromJson(json)).toList();
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load movies from JSON');
    }
  }

  @override
  Future<MovieDetailDto> fetchMovieDetail(int movieId) async {
    final String? apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print('Error: API_KEY is not set in .env file');
      throw Exception('API_KEY is not set');
    }

    final String url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response body: ${response.body}'); // 응답 본문 출력

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Movie Detail JSON: $jsonResponse'); // 영화 상세 정보 출력

        return MovieDetailDto.fromJson(jsonResponse);
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        print('Response body: ${response.body}'); // 오류 응답 본문 출력
        throw Exception('Failed to load movie detail');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load movie detail');
    }
  }

  @override
  Future<List<MovieDto>> fetchPopularMovies() async {
    final String? apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print('Error: API_KEY is not set in .env file');
      throw Exception('API_KEY is not set');
    }

    final String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response body: ${response.body}'); // 응답 본문 출력

      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        print('Results: $results'); // 결과 리스트 출력

        return results.map((movie) {
          print('Movie JSON: $movie'); // 각 영화 객체 출력
          return MovieDto.fromJson(movie);
        }).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        print('Response body: ${response.body}'); // 오류 응답 본문 출력
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<List<MovieDto>> fetchTopRatedMovies() async {
    final String? apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print('Error: API_KEY is not set in .env file');
      throw Exception('API_KEY is not set');
    }

    final String url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response body: ${response.body}'); // 응답 본문 출력

      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        print('Results: $results'); // 결과 리스트 출력

        return results.map((movie) {
          print('Movie JSON: $movie'); // 각 영화 객체 출력
          return MovieDto.fromJson(movie);
        }).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        print('Response body: ${response.body}'); // 오류 응답 본문 출력
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load top rated movies');
    }
  }

  @override
  Future<List<MovieDto>> fetchUpcomingMovies() async {
    final String? apiKey = dotenv.env['API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print('Error: API_KEY is not set in .env file');
      throw Exception('API_KEY is not set');
    }

    final String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response body: ${response.body}'); // 응답 본문 출력

      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        print('Results: $results'); // 결과 리스트 출력

        return results.map((movie) {
          print('Movie JSON: $movie'); // 각 영화 객체 출력
          return MovieDto.fromJson(movie);
        }).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        print('Response body: ${response.body}'); // 오류 응답 본문 출력
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load upcoming movies');
    }
  }
}
