import 'package:flutter/material.dart';

class Game {
  final String name;
  final String imagePath;

  Game({required this.name, required this.imagePath});
}

class AllGamePage extends StatelessWidget {
  final List<Game> games = [
    Game(name: 'Minecraft', imagePath: 'images/games/game0.jpg'),
    Game(name: 'Fortnite', imagePath: 'images/games/game1.jpg'),
    Game(name: 'Roblox', imagePath: 'images/games/game2.jpg'),
    Game(name: 'Red Dead Redemption 2', imagePath: 'images/games/game3.jpg'),
    Game(name: 'Apex Legends', imagePath: 'images/games/game4.jpg'),
    Game(name: 'League of Legends', imagePath: 'images/games/game5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 200,
          child: Card(
              child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(games[index].imagePath),
                          fit: BoxFit.cover)),
                ),
              
              ),
              SizedBox(height: 20,),
              Expanded(flex: 1, child: Text(games[index].name)),
            ],
          )),
        );
      },
    );
  }
}
