
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/pages/home.dart';
import '../lib/pages/user.dart';
import '../lib/pages/user_drawers/friends.dart';
import '../lib/pages/user_drawers/addFriend.dart';
import '../lib/tools/routes.dart';
import './elements.dart';
import '../lib/main.dart' as app;
import '../lib/tools/account.dart';

extension Uihelper on WidgetTester{
   Future<void> pumpHomePage(){
    return pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
          ),
          home: HomePage(arguments: {'user': userList[1]}),
          //initialRoute: '/friends',
          onGenerateRoute: onGenerateRoute,
        ),
      );
  }
Future<void> pumpUserPage(){
    return pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
          ),
          home: UserPage(arguments: {'user': userList[1]}),
          //initialRoute: '/friends',
          onGenerateRoute: onGenerateRoute,
        ),
      );
  }
  Future<void> pumpFriendsPage(){
    return pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
          ),
          home: FriendsPage(arguments: {'user': userList[1]}),
          //initialRoute: '/friends',
          onGenerateRoute: onGenerateRoute,
        ),
      );
  }
}