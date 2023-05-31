import 'package:flutter/material.dart';
import '../tools/account.dart';

class UserPage extends StatefulWidget {
  final Map arguments;
  UserPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _currentIndex = 0;
  late User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //user = userList[widget.arguments['id']];
    user = widget.arguments['user'];
    print(widget.arguments);
    //user = widget.arguments;
    print('user page ${user.userName} ${user.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: MyBody(
        user: user,
      ),
      drawer: MyDrawer(user: user),
    );
  }
}

class MyBody extends StatelessWidget {
  User user;
  MyBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String? location= user.location;
    return Flex(direction: Axis.vertical, children: [
      Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: CircleAvatar(
          radius: 80,
          backgroundImage:
              NetworkImage('https://source.unsplash.com/k9XZPpPHDho'),
        ),
      ),
      Expanded(
        flex: 1,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          padding: EdgeInsets.all(10),
          children: [
            //name
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          print(user.userName);
                          Navigator.pushNamed(context, '/name',
                              arguments: {'user': user});
                        },
                        child: Text(
                          '${user.userName}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //email
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Icon(
                        Icons.email,
                        size: 100,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/email',
                              arguments: {'user': user});
                        },
                        child: Text(
                          '${user.email}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //address
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Icon(
                        Icons.location_on,
                        size: 100,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/address',
                              arguments: {'user': user});
                        },
                        child: Text(location??'Address'
                         ,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //hobby
            // Card(
            //   color: Colors.white,
            //   elevation: 5,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //   child: SizedBox(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         Expanded(
            //           flex: 3,
            //           child: Icon(
            //             Icons.interests,
            //             size: 100,
            //           ),
            //         ),
                   
            //         Expanded(
            //           flex: 1,
            //           child: TextButton(
            //             onPressed: () {
            //               Navigator.pushNamed(context, '/hobby',
            //                   arguments: {'user': user});
            //             },
            //             child: Text(
            //               'Hobby',
            //               style: TextStyle(color: Colors.black, fontSize: 18),
            //             ),
            //             style: ButtonStyle(
            //                 shape: MaterialStateProperty.all<
            //                     RoundedRectangleBorder>(RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(0),
            //             ))),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    ]);
  }
}

class MyDrawer extends StatelessWidget {
  User user;
  MyDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: UserAccountsDrawerHeader(
                  accountName: Text('${user.userName}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),),
                  accountEmail: Text('${user.email}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://source.unsplash.com/k9XZPpPHDho'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://source.unsplash.com/pKpipZVVEC0'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          //home
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.home)),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/home', arguments: {'user': user});
            },
          ),
          SizedBox(height: 10),
          //friends
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.people)),
            title: Text("Friends"),
            onTap: () {
              print(user.id);
              Navigator.pushNamed(context, '/friends',
                  arguments: {'user': user });
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.games)),
            title: Text("Games"),
            onTap: () {
              Navigator.pushNamed(context, '/games', arguments: {'user': user});
            },
          ),
          SizedBox(height: 10),
          //books
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.book)),
            title: Text("Books"),
            onTap: () {
              Navigator.pushNamed(context, '/books', arguments: {'user': user});
            },
          ),
        ],
      ),
    );
  }
}
