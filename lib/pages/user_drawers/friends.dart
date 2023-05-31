import 'package:flutter/material.dart';
import '../../tools/account.dart';

class FriendsPage extends StatefulWidget {
  final arguments;
  FriendsPage({super.key, required this.arguments});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.arguments['user'];
  }

  @override
  Widget build(BuildContext context) {
    user.friends?.sort((a, b) => a.name.compareTo(b.name));
    int? count = user.friends?.length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Friends"),
      ),
      body: ListView.builder(
        itemCount: count??0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.friends?[index].imageUrl),
                radius: 30,
              ),
              title: Text(user.friends?[index].name),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print('friend details');
              },
            ),
          );
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
        child: FloatingActionButton(
          onPressed: () {
            print('add new friend');
            Navigator.popAndPushNamed(context, '/addFriend',
                arguments: {'user': user});
          },
          child: Icon(Icons.add),
          shape: CircleBorder(),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
