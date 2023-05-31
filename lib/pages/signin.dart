import 'package:flutter/material.dart';
import '../tools/account.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // int _verifyLogin(String username, String password) {
  //   // print('${username} ${password}');
  //   // print(userList);
  //   for (int i = 0; i < userList.length; i++) {
  //     //print('${i} ${userList[i].userName == username } ${userList[i].userName} ${userList[i].password}');
  //     if (userList[i].userName == username || userList[i].email == username) {
  //       if (userList[i].password == password) {
  //         return i;
  //       }
  //     }
  //   }
  //   return -1;
  // }
//  String? _getUserEmail(String username, String password) {
//     // print('${username} ${password}');
//     // print(userList);
//     for (int i = 0; i < userList.length; i++) {
//       //print('${i} ${userList[i].userName == username } ${userList[i].userName} ${userList[i].password}');
//       if (userList[i].userName == username || userList[i].email == username) {
//         if (userList[i].password == password) {
//           return userList[i].email;
//         }
//       }
//     }
//     return null;
//   }
  User? _getUser(String username, String password) {
    // print('${username} ${password}');
    // print(userList);
    for (int i = 0; i < userList.length; i++) {
      //print('${i} ${userList[i].userName == username } ${userList[i].userName} ${userList[i].password}');
      if (userList[i].userName == username || userList[i].email == username) {
        if (userList[i].password == password) {
          return userList[i];
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.blue,
        //title: Text('Sign In'),
      ),
      body: Container(
        color: Colors.white,
        //Color.fromRGBO(0,187,227, 1),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Container(
              height: height / 12,
              child: Image.asset('images/jci_icon.jpg'),
            ),
            Divider(),
            Icon(
              Icons.person_outlined,
              size: width / 4,
            ),
            SizedBox(height: width / 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
                hintText: 'Username or Email',
              ),
            ),
            SizedBox(height: width / 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Your Password'),
            ),
            SizedBox(height: width / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    print('New User');
                    Navigator.pushNamed(context, '/register');
                    // Forgot Password logic here
                  },
                  child: Text('New User'),
                ),
                TextButton(
                  onPressed: () {
                    print('forget passowrd');
                    // Forgot Password logic here
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: width / 20),
            ElevatedButton(
              onPressed: () {
                print('button');
                String username = _usernameController.text;
                String password = _passwordController.text;
                //print('${username}  ${password}');
                setState(() {
                  // if (_verifyLogin(username, password) != -1) {
                  //   print('sucess');
                  //   int i = _verifyLogin(username, password);
                  //   print('${userList[i]}  ${i} sign in page');
                  //   Navigator.pushNamed(context, '/home', arguments: {'index': i});
                  //   //arguments: {'id': i}
                  // }
                  // String? email=_getUserEmail(username, password);
                  // if(email !=null){
                  //   print('sucess');
                  //   Navigator.pushNamed(context, '/home', arguments: {'email':email });
                  // }
                  User? user = _getUser(username, password);
                  if (user != null) {
                    print('sucess');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Success'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                    Navigator.pushNamed(context, '/home',
                        arguments: {'user': user});
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('The user name or password is not valid'),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.redAccent,
                                    //duration: Duration(seconds: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                  }
                });
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
