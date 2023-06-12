import 'package:flutter/material.dart';
import '../tools/account.dart';
import '../pages/home.dart';
import '../pages/user.dart';
import '../pages/user_drawers/friends.dart';
import '../pages/signin.dart';
import '../pages/register.dart';
import '../pages/user_cards/name.dart';
import '../pages/user_cards/address.dart';
import '../pages/user_cards/email.dart';
import '../pages/user_drawers/books.dart';
import '../pages/user_drawers/games.dart';
import '../pages/user_drawers/addFriend.dart';
import '../pages/counter.dart';

Map myRoutes = {
  '/': (context) => SignInPage(),
  '/user': (context, {arguments}) => UserPage(arguments: arguments),
  '/home': (context, {arguments}) => HomePage(arguments: arguments),
  '/friends': (context,{arguments}) => FriendsPage(arguments: arguments),
  '/addFriend': (context,{arguments}) => AddFriendPage(arguments: arguments),
  '/register':(context) =>RegistrationPage(),
  '/name': (context,{arguments}) => NamePage(arguments: arguments),
  '/address': (context,{arguments}) => AddressPage(arguments: arguments),
  '/hobby': (context,{arguments}) => NamePage(arguments: arguments),
  '/email': (context,{arguments}) => EmailPage(arguments: arguments),
  '/books': (context,{arguments}) => BookPage(arguments: arguments),
  '/games': (context,{arguments}) => GamesPage(arguments: arguments),
  '/counter':()=>CounterPage(),

};

//midleware
var onGenerateRoute = (RouteSettings settings) {
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
