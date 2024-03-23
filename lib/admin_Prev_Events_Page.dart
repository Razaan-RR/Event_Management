import 'package:flutter/material.dart';

class PreviousEventsPage extends StatelessWidget {
  const PreviousEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Previous Events'),
      // ),
      body: Center(
        child: Text(
          'This is the Previous Events Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
