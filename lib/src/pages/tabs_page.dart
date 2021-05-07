import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

///=============================================================================
class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Page 1' ),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Page 2' ),
        ]);
  }
}

///=============================================================================
class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

///=============================================================================
