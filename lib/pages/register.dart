import 'dart:math';
import 'package:flutter/material.dart';
import '../tools/account.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text('Registration Page'),
      ),
      body: Container(
        color: Colors.white,
        //Color.fromRGBO(0,187,227, 1),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
            // alignment: Alignment.center,
            // padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
            children: [
              Container(
                  height: height / 12,
                  child: Image.asset('images/jci_icon.jpg')),
              Divider(),
              Container(
                  height: height / 10,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
              SizedBox(height: height / 40),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //name
                      TextFormField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            labelText: 'User Name',
                            prefixIcon: Icon(Icons.person)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a user name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height / 40),
                      //email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.email)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height / 40),
                      //password 1
                      TextFormField(
                        controller: _passwordController1,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height / 40),
                      //password 2
                      TextFormField(
                        controller: _passwordController2,
                        decoration: InputDecoration(
                            labelText: 'Enter Password Again',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password again';
                          }
                          // You can add additional password validation logic here
                          return null;
                        },
                      ),
                      SizedBox(height: height / 40),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String userName = _userNameController.text;
                              String email = _emailController.text;
                              String password1 = _passwordController1.text;
                              String password2 = _passwordController2.text;

                              if (password1 == password2) {
                                print('sucess');
                                User newUser = User(
                                    email: email,
                                    password: password1,
                                    userName: userName);
                                // Use the 'newUser' object as needed (e.g., store it in a database)
                                userList.add(newUser);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Registration successful'),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.greenAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                                Navigator.pushNamed(context, '/');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('The passwords are different'),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text('Register'),
                        ),
                      ),
                      SizedBox(height: height / 40),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
