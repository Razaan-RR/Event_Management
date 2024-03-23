import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'generalUserLoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JoinAsGeneralUserPage extends StatelessWidget {
  const JoinAsGeneralUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> signInWithEmailAndPassword(String email, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Check the role of the user
        String uid = userCredential.user!.uid; // Get the UID of the currently signed-in user
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

        if (userDoc.exists && userDoc.data() is Map) {
          Map userData = userDoc.data() as Map<String, dynamic>;
          String role = userData['role']; // Assuming you have a 'role' field

          if (role == 'general_User') {
            // If the user is a general user, navigate to the GeneralUserUpcomingEvents page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeneralUserLoginScreen()),
            );
          } else {
            // If the user is not a general user, show an error message
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Access denied. Only general users can log in."),
            ));

            // Optional: sign out the user
            FirebaseAuth.instance.signOut();
          }
        } else {
          // Handle the case where the user document does not exist or does not have the expected data
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("User profile error. Please contact support."),
          ));

          // Optional: sign out the user
          FirebaseAuth.instance.signOut();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sign-in error: $e"),
        ));
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFB9E5F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFB9E5F8),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('assets/admin_Sign_In.png'),
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "ULAB EventPedia",
                        style: TextStyle(
                          color: Color.fromRGBO(5, 112, 126, 1.0),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Sign In to continue your journey as a General User with us",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF46C5FB),
                          Color(0xFFb7dded),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 350,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Password:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 350,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(height: 50),
                          Center(
                            child: Container(
                              width: 270,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF53bcd4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  signInWithEmailAndPassword(emailController.text, passwordController.text);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
