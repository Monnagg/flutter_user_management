import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/user.dart';
import '../pages/tabs/friends.dart';
import '../pages/signin.dart';
import '../pages/register.dart';

Map myRoutes = {
  '/': (context) => SignInPage(),
  '/user': (context, {arguments}) => UserPage(arguments: arguments),
  '/home': (context, {arguments}) => HomePage(),
  '/friends': (context,{arguments}) => FriendsPage(arguments: arguments),
  '/register':(context) =>RegistrationPage(),
  '/signin':(context) =>SignInPage(),
};

//midleware
var onGenerateRoute = (RouteSettings settings) {
  // print(settings);
  // print(settings.name); //get name of named routes
  // print(settings.arguments);
  final String? name = settings.name; //eg. '/user'
  final Function? pageContentBuilder = myRoutes[
      name]; //the function corresponding to route name eg.UserPage(arguments: arguments)
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
