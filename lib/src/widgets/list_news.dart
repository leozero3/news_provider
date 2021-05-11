import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(news: this.news[index], index: index);
      },
    );
  }
}

///==============================================================================================///
class _New extends StatelessWidget {
  final Article news;
  final int index;

  const _New({@required this.news, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(news, index),
        _CartTitle(news),
        _CartImage(news),
        _CartBody(news),
        _Cardbuttons(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

///==============================================================================================///
class _CardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _CardTopBar(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text('${news.source.name}')
        ],
      ),
    );
  }
}

///==============================================================================================///
class _CartTitle extends StatelessWidget {
  final Article news;

  const _CartTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

///==============================================================================================///
class _CartImage extends StatelessWidget {
  final Article news;

  const _CartImage(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(news.urlToImage),
                  )
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

///==============================================================================================///
class _CartBody extends StatelessWidget {
  final Article news;

  const _CartBody(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((news.description != null) ? news.description : ''),
    );
  }
}

///==============================================================================================///
class _Cardbuttons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: myTheme.accentColor,
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.blue,
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}
