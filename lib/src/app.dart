import 'package:flutter/material.dart';
import 'package:login_sqlite/src/pages/login.dart';
import 'package:login_sqlite/src/pages/register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
      ),
      routes: <String, WidgetBuilder>{
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
      },
    );
  }

}
