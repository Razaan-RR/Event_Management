import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Admin Profile'),
      // ),
      body: Center(
        child: Text(
          'This is the Admin Profile Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
