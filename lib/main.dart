import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_provider/src/pages/tabs_page.dart';
import 'package:news_provider/src/services/news_services.dart';
import 'package:news_provider/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: myTheme,
        home: TabsPage(),
      ),
    );
  }
}