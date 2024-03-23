import 'package:ulab_eventpedia_main/admin_SignIn_page.dart';
import 'package:ulab_eventpedia_main/generalUser_SignIn_page.dart';

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFB9E5F8),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset('assets/main_page_img.png'),
              SizedBox(
                height: 80,
              ),
              Text(
                "Welcome to ULAB EventPedia",
                style: TextStyle(
                  color: Color.fromRGBO(5,112,126,1.0),
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 50), // Space between text and buttons
              SizedBox(
                width: 280,
                height: 70,
                child: MaterialButton(
                  onPressed: () {
                    // Handle button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinAsAdminPage()),
                    );
                  },
                  color: Color(0xFF78D2E6),
                  textColor: Color(0xff274560),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none, ),
                  ),
                  child: Text(
                    "Join as Admin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Space between buttons
              SizedBox(
                width: 280,
                height: 70,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinAsGeneralUserPage()),
                    );                  },
                  color: Color(0xFF78D2E6),
                  textColor: Color(0xff274560),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none, ),
                  ),
                  child: Text(
                    "Join as General User",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
