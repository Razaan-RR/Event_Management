import 'package:flutter/material.dart';

class GeneralUserLoginScreen extends StatefulWidget {
  const GeneralUserLoginScreen({super.key});

  @override
  State<GeneralUserLoginScreen> createState() =>
      _GeneralUserUpcomingEventsState();
}

class _GeneralUserUpcomingEventsState
    extends State<GeneralUserLoginScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'GU Upcoming Events Page',
      style: optionStyle,
    ),
    Text(
      'GU Previous Events Page',
      style: optionStyle,
    ),
    Text(
      'GU Create Events Page',
      style: optionStyle,
    ),
    Text(
      'User Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home_page.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/previous_events.png',
              width: 24,
              height: 24,
            ),
            label: 'Previous Events',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/create_events.png',
              width: 24,
              height: 24,
            ),
            label: 'Create Events',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


