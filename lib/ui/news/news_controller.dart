import 'package:bumaco_aios/app_core/models/article.dart';
import 'package:bumaco_aios/app_core/repository/news_repo.dart';
import 'package:bumaco_aios/app_core/repository/news_repo_impl.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  late NewsRepo _newsRepo;

  // @override
  // void onInit() {
  //   _newsRepo = Get.find<NewsRepo>(); 
  //   loadNewsHeadlines();
  //   super.onInit();
  // }

  NewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsHeadlines();
  }
  late RxList<Article> articles;
  RxBool isLoading = false.obs;

  loadNewsHeadlines() async {
    isLoading.toggle();

    final result = await _newsRepo.getNewsHeadlines();

    isLoading.toggle();

    if (result != null) {
      articles = result.obs;
    } else {
      print('No data found!');
    }
  }
}
