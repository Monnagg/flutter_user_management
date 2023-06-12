import 'dart:math';
import 'package:flutter/material.dart';
import '../../consts/router_keys.dart';
import '../../tools/account.dart';

class AddFriendPage extends StatefulWidget {
  final Map arguments;
  AddFriendPage({super.key, required this.arguments});

  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriendPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _emailController2 = TextEditingController();
  late User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.arguments['user'];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Friend'),
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
                margin: EdgeInsets.all(20),
                child: Icon(
                  Icons.person,
                  size: 120,
                ),
              ),
              Divider(),
              // Container(
              //     height: height / 10,
              //     alignment: Alignment.bottomCenter,
              //     child: Text(
              //       'Add New Friend',
              //       style: TextStyle(
              //         fontSize: 18,
              //       ),
              //     )),
              SizedBox(height: height / 40),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: RouterKeys.friend_name,
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
                      TextFormField(
                        key: RouterKeys.friend_email1,
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
                      TextFormField(
                        key: RouterKeys.friend_email2,
                        controller: _emailController2,
                        decoration: InputDecoration(
                            labelText: 'Enter Eamil Again',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.email)),
                        //obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email again';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height / 40),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          key: RouterKeys.friend_add,
                          onPressed: () {
                            print('click');
                            if (_formKey.currentState!.validate()) {
                              String userName = _userNameController.text;
                              String email = _emailController.text;
                              String email2 = _emailController2.text;
                              if (email == email2) {
                                Friend friend = new Friend(
                                    name: userName,
                                    imageUrl:
                                        'https://source.unsplash.com/random/?person');
                                (user.friends = user.friends ?? []).add(friend);
                                print(user.friends);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Add successful'),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.greenAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                                print('before navigation');
                                Navigator.popAndPushNamed(context, '/friends',
                                    arguments: {'user': user});
                                print('After navigation');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'The email addresses are different'),
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
                          child: Text('Add'),
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
