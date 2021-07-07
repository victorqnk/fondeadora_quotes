import 'package:flutter/material.dart';
import 'package:fondeadora/controllers/user.dart';
import 'package:fondeadora/views/home.dart';
import 'package:fondeadora/views/login.dart';
import 'package:fondeadora/views/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: MaterialApp(
        title: 'Fondeadora Coding Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.black,
          accentColor: Colors.red.shade400,
          canvasColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade400,
              elevation: 0,
              enableFeedback: true,
              minimumSize: Size(double.infinity, 42.0),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.red.shade400,
            ),
          ),
        ),
        routes: {
          '/': (context) => Welcome(),
          'login': (context) => Login(),
          'home': (context) => Home(),
        },
      ),
    );
  }
}
