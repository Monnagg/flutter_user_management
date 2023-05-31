import 'package:flutter/material.dart';
import '../../tools/account.dart';


class HobbiesPage extends StatefulWidget {
  final Map arguments;
  const HobbiesPage({super.key, required this.arguments});

  @override
  State<HobbiesPage> createState() => _HobbiesPageState();
}

class _HobbiesPageState extends State<HobbiesPage> {
  late User user;
  @override
  void initState() {
    // TODO: implement initState
    user = widget.arguments['user'];
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}