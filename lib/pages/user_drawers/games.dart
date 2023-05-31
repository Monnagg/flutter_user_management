import 'package:flutter/material.dart';
import 'games/allGames.dart';
import 'games/favoriteGame.dart';
import '../../tools/account.dart';

class GamesPage extends StatefulWidget {
  final Map arguments;
  const GamesPage({super.key, required this.arguments});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class Game {
  final String name;
  final String imagePath;

  Game({required this.name, required this.imagePath});
}

class _GamesPageState extends State<GamesPage> {
  late User user;
  int _currentIndex = 0;
  List<Widget> _pages = [AllGamePage(),FavoriteGames()];
   

  @override
  void initState() {
    // TODO: implement initState
    user = widget.arguments['user'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Games")),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'All'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'My Favorite'),
        ],
      ),
    );
  }
}
