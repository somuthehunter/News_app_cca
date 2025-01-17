import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/daily_news/domain/entities/article.dart';
import 'package:newsapp/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
