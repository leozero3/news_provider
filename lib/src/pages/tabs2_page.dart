import 'package:flutter/material.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/services/news_services.dart';
import 'package:news_provider/src/theme/theme.dart';
import 'package:news_provider/src/widgets/list_news.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsServices>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            _ListCategories(),

            if (!newsService.isLoading)
              Expanded(
                child: ListNews(newsService.getArticlesCategorySelected),
              ),

            if (newsService.isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )



          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsServices>(context).categories;

    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final cName = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                CategoryButton(categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {

  final Category categories;

  const CategoryButton(this.categories);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsServices>(context);

    return GestureDetector(
      onTap: () {

        final newsService = Provider.of<NewsServices>(context, listen: false);
        newsService.selectedCategory = categories.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categories.icon,
          color: (newsService.selectedCategory == categories.name)
              ? myTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}