import 'package:flutter/material.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/services/news_services.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _ListCategories(),
            ),
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


    return ListView.builder(
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
    );
  }
}

class CategoryButton extends StatelessWidget {

  final Category categories;
  const CategoryButton(this.categories);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(categories.name);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(categories.icon, color: Colors.black54,),
      ),
    );
  }
}
