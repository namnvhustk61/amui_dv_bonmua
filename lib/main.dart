import 'dart:io';

import 'package:dichvubonmua/ui/account/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'storage/AppPreferences.dart';
import 'ui/account/login/LoginScreen.dart';
import 'ui/home/HomeScreen.dart';

void main() async{
  if (Platform.isAndroid) {
// The following two lines set the android status bar to be transparent immersive. Written after component rendering, in order to assign a value after rendering, override the status bar, the MaterialApp component will override this value before rendering.
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent, systemNavigationBarDividerColor: Colors.white);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().init();
  String login_info = AppPreferences().getString(key: AppPrefKey.LOGIN_INFO);
  bool isLogined = login_info!=AppPreferences().defaultString;
  runApp(MyApp(isLogined: isLogined,));
}

class MyApp extends StatelessWidget {

  final bool isLogined;
  const MyApp({Key? key, required this.isLogined,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: isLogined ? 'home' : 'login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) {
        Map arguments = Map();
        try {
          arguments =
          settings.arguments != null ? settings.arguments as Map : Map();
        } catch (e) {
          arguments = Map();
        }
        final name = settings.name;
        print('router to [$name] arguments [$arguments]');
        switch (name) {
          case "login":
            return MaterialPageRoute(builder: (_) => LoginScreen());
          case "login/register":
            return MaterialPageRoute(builder: (_) => RegisterScreen());
          case "home":
            return MaterialPageRoute(builder: (_) => HomeScreen());
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                      child:
                      Text('No route defined for ${settings.name}')),
                ));
        }
      },
    );
  }
}
