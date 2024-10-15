import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:newsapp/features/daily_news/data/repository/article_repository_implementation.dart';
import 'package:newsapp/features/daily_news/domain/repository/article_repository.dart';
import 'package:newsapp/features/daily_news/domain/usecases/get_article.dart';
import 'package:newsapp/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //usecase implementation
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  //bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
