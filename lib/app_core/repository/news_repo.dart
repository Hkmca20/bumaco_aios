import 'package:bumaco_aios/app_core/models/article.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadlines();
  
  Future<List<Article>?> getSearchNews(String query);
  
}
