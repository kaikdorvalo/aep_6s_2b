import 'package:flutter/material.dart';
import 'package:front/main_page.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([]),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MainPage(),
          },
        );
      },
      child: null,
    );
  }
}
