import 'package:flutter/material.dart';
import '../tools/account.dart';

class User {
  final String userName;
  final String email;

  User(this.userName, this.email);
}

class HomePage extends StatelessWidget {
  User user = User('John Doe', 'john@example.com');

void _getUserByEmail(String email) {
  // print('${username} ${password}');
  // print(userList);
  for (int i = 0; i < userList.length; i++) {
    //print('${i} ${userList[i].userName == username } ${userList[i].userName} ${userList[i].password}');
    if (userList[i].email == email) {
      //user = userList[i];
      break;
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Home Page'),
      ),
      backgroundColor: Color.fromRGBO(211, 211, 211, 1),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: double.maxFinite,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset(
                  'images/router.jpg',
                  fit: BoxFit.contain,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: double.maxFinite,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Router Setting',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Connected',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Colors.white,
            height: 40,
            child: Text(
              'User Access',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        Icons.person_2,
                        size: 40,
                      ),
                      title: Text(user.userName),
                      subtitle: Text(user.email),
                      //trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print('friend details');
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


