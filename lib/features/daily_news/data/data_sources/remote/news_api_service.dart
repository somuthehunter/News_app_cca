// import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:newsapp/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
// import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';

import '../../models/article.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
