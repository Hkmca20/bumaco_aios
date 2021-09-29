import 'package:bumaco_aios/app_core/models/article.dart';
import 'package:bumaco_aios/app_core/models/news_response_model.dart';
import 'package:bumaco_aios/app_core/repository/news_repo.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

class NewsRepoImpl extends NewsRepo {
  late DioClient _client;
  NewsRepoImpl() {
    _client = Get.put(DioClientImpl());
    _client.init();
  }
  @override
  Future<List<Article>?> getNewsHeadlines() async {
    final response;
    try {
      response = await _client
          .getRequest('/top-headlines?country=us&category=business');
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchNews(String query) async{
    final response;
    try {
      response = await _client
          .getRequest('/everything?q=$query');
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
