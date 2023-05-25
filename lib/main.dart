import 'package:flutter/material.dart';
// import 'package:user_management/pages/login.dart';
// import './pages/home.dart';
// import './pages/user.dart';
// //import './pages/login.dart';
// import './pages/tabs/friends.dart';
// import './pages/signin.dart';
import './tools/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute:onGenerateRoute, 
    );
  }
}
