import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsController = Get.find<NewsController>();
    return Scaffold(
      appBar: BumacoAppbar(title: 'Blogs'),
      // bottomNavigationBar: getBottomNavigationBar(),
      body: Obx(() => newsController.isLoading.isTrue
          ? Center(child: LoadingWidget())
          : ListView.separated(
              itemBuilder: (context, index) {
                return Column(children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(newsDetailRoute, arguments: {
                          'get_article': newsController.articles[index]
                        });
                      },
                      child: Image.network(
                          newsController.articles[index].urlToImage ?? '')),
                  SizedBox(height: 10),
                  Text(newsController.articles[index].title,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                ]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: newsController.articles.length)),
    );
  }

  getBottomNavigationBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.amber.shade200,
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            tooltip: 'Home Page',
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit)),
        ]);
  }
}
