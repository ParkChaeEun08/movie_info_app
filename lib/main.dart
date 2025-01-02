import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'presentation/pages/movie_list/movie_list.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: '.env'); // .env 파일 로드
  } catch (e) {
    print('Failed to load .env file: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MovieListPage(),
    );
  }
}
