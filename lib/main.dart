import 'package:flutter/material.dart';
import 'package:new_flutter_compass/screens/home_screen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ThemeProvider(
      initTheme: ThemeData.light(),
      builder: (_, myTheme) {
        return MaterialApp(
debugShowCheckedModeBanner: false,
          theme: myTheme,
          home:  HomeScreen(),
        );
      },
    );
  }
}
