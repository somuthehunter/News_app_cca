import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/config/themes/app_theme.dart';
import 'package:newsapp/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:newsapp/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:newsapp/injection_container.dart';

void main() async {
  // Ensures that Flutter engine is initialized before performing async tasks
  // WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: DailyNews(),
    ),
    );
  }
}
