import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/pages/signin.dart';
import 'package:user_management/pages/user_drawers/addFriend.dart';
import './providers/counter_provider.dart';
import 'package:user_management/tools/account.dart';
import './tools/routes.dart';
import './pages/counter.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      create: (_)=> Counter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        home: CounterPage(),
        //initialRoute: '/counter',
        onGenerateRoute:onGenerateRoute, 
      ),
    );
  }
}
