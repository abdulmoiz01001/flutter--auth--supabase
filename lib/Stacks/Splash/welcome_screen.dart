import 'package:flutter/material.dart';
import 'package:loginsignup/Stacks/Auth/Pages/login_screen.dart';
import 'package:loginsignup/Stacks/Auth/Pages/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 191, 22, 51), // Red
              Color.fromARGB(255, 43, 24, 56), // Green
              // Color(0xFF0000FF), // Blue
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
              SizedBox(height:  MediaQuery.of(context).size.width*.3 ,),
                Image.asset("assets/images/dumbbell.png", scale: 2),
                Text(
                  "FITNESS CLUB",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width*.8,
                    child: ElevatedButton(
                      onPressed: () {   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));},
                      style: ElevatedButton.styleFrom(
                       
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                          side: BorderSide(
                              color: Colors.white, width: 2), // White border
                        ),
                        backgroundColor: Colors.transparent, // Fully transparent background
                        shadowColor: Colors.transparent, // No shadow
                        foregroundColor: Colors.white, // Text color white
                      ),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.8,
                    child: ElevatedButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen()));},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                          side: BorderSide(
                              color: Colors.white, width: 2), // White border
                        ),
                        backgroundColor:
                            Colors.white, // Fully transparent background
                        shadowColor: Colors.transparent, // No shadow
                        // foregroundColor: Colors.white, // Text color white
                      ),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Login with Social Media",
                      style: TextStyle(color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/instagram.png", scale: 12),
                    SizedBox(width: 10),
                    Image.asset("assets/images/twitter.png", scale: 18),
                    SizedBox(width: 10),
                    Image.asset("assets/images/facebook.png", scale: 18),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  }
