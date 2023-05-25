import 'package:flutter/material.dart';
import '../tools/account.dart';

class SignInPage extends StatefulWidget {
  
   SignInPage({super.key,});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _verifyLogin(String username, String password) {
    // print('${username} ${password}');
    // print(userList);
    for (int i = 0; i < userList.length; i++) {
      //print('${i} ${userList[i].userName == username } ${userList[i].userName} ${userList[i].password}');
      if (userList[i].userName == username || userList[i].email == username) {
        if (userList[i].password == password) {
          return i;
        }
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
                hintText: 'Username or Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Your Password'),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print('button');
                String username = _usernameController.text;
                String password = _passwordController.text;
                //print('${username}  ${password}');
                setState(() {
                  if (_verifyLogin(username, password) != -1) {
                    print('sucess');
                    int i = _verifyLogin(username, password);
                    print('${userList[i]}  ${i} sign in page');
                    Navigator.pushNamed(
                      context,
                      '/user',arguments: {'id': i}
                    );
                    //arguments: {'id': i}
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
