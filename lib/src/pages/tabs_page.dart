import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/tabs1_page.dart';
import 'package:news_provider/src/pages/tabs2_page.dart';
import 'package:news_provider/src/services/news_services.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

///=============================================================================
class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    final newsService = Provider.of<NewsServices>(context);

    return BottomNavigationBar(
        currentIndex: navigationModel.currentPage,
        onTap: (i) => navigationModel.currentPage = i,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Page 2'),
        ]);
  }
}

///=============================================================================
class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}

///=============================================================================

class _NavigationModel with ChangeNotifier {
  ///
  int _currentPage = 0;

  ///getter e setter
  int get currentPage => this._currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController _pageController = PageController();

  ///getter
  PageController get pageController => _pageController;
}
