import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/Stacks/Auth/Controllers/signup_controller.dart';
import 'package:loginsignup/Stacks/Auth/Pages/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> goodToGo = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());

  bool _obscureText1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 191, 22, 51), // Red
              Color.fromARGB(255, 43, 24, 56), // Dark purple
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height:  MediaQuery.of(context).size.width*.1,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Create Your\nAccount",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.more_horiz, size: 35, color: Colors.white),
                ],
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.width*.1,),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: goodToGo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name
                        const Text(
                          "Full Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "username required";
                            } else if (!value.startsWith(RegExp(r'[A-Z]'))){
                              return "Start with Capital Letter";
                            } else{
                              return null;
                            }
                          },
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: "John Smith",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color.fromARGB(255, 43, 24, 56), // Dark purple
                              )
                            ),
                            suffixIcon: Icon(Icons.check, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                    
                        // Phone or Email
                        const Text(
                          "Phone or Gmail",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "email required";
                            } else if (!value.endsWith("@gmail.com")){
                              return "invalid email";
                            } else{
                              return null;
                            }
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Joydeo@gmail.com",
                             focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color.fromARGB(255, 43, 24, 56), // Dark purple
                              )
                            ),
                            suffixIcon: Icon(Icons.check, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                    
                        // Password
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "password required";
                            } else if (!value.contains(RegExp(r'[A-Z]'))){
                              return "capital Letter";
                            } else if (!value.contains(RegExp(r'[a-z]'))){
                              return "small Letter";
                            } else if (!value.contains(RegExp(r'[0-9]'))){
                              return "numbers ";
                            } else{
                              return null;
                            }
                          },
                          controller: passwordController,
                          obscureText: _obscureText1,
                          decoration: InputDecoration(
                            hintText: "********",
                             focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color.fromARGB(255, 43, 24, 56), // Dark purple
                              )
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      
                        // Confirm Password
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value! == passwordController.text){
                              return null;
                            } else {
                              return "password doesn't match";
                            }
                          },
                          obscureText: _obscureText1,
                          decoration: InputDecoration(
                            hintText: "********",
                             focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color.fromARGB(255, 43, 24, 56), // Dark purple
                              )
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                        ),
                       SizedBox(height: MediaQuery.of(context).size.width*.1),
                    
                        // Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          child: signUpController.isLoading.value? CircularProgressIndicator(): ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              if (goodToGo.currentState!.validate()){
                                signUpController.registerUser(usernameController.text, emailController.text, passwordController.text, "user");
                              }
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 191, 22, 51), // Red
                                    Color.fromARGB(
                                        255, 43, 24, 56), // Dark Purple
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                constraints: const BoxConstraints(
                                    minWidth: 100, minHeight: 50),
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height:  MediaQuery.of(context).size.width*.1),
                        // Don't Have an Account? Sign In
                        Align(
                          alignment: Alignment
                              .bottomRight, // Ensures the text is centered
                          child: GestureDetector(
                            onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));},
                            child: RichText(
                              textAlign:
                                  TextAlign.end, // Aligns text inside RichText
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: "\nSign in",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 43, 24, 56),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
