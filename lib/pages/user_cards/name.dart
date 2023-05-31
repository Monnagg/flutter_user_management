import 'package:flutter/material.dart';
import '../../tools/account.dart';

class NamePage extends StatefulWidget {
  final Map arguments;
  NamePage({super.key, required this.arguments});
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController _usernameController = TextEditingController();
  late User user;
  @override
  void initState() {
    // TODO: implement initState
    user = widget.arguments['user'];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        centerTitle: true,
        title: Text('Edit Name'),
        leading: IconButton(
          icon: Text(
            'Cancel', // Replaced with the text "cancel"
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: width / 5,
        actions: [
          IconButton(
            icon: Text(
              'Save',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              if (_usernameController.text != '') {
                user.userName = _usernameController.text;
                print('name page sucess');
                showConfirmDialog();
              } else {
                alertInvalidName();
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              //labelText: 'Username',
              hintText: user.userName,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Reminder"),
          content: Text("Please confirm to save the name"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                //Navigator.of(context).pop(true);
                Navigator.popAndPushNamed(context, '/user',
                    arguments: {'user': user});
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool?> alertInvalidName() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Reminder"),
          content: Text("The name could not be Empty!"),
          actions: <Widget>[
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
