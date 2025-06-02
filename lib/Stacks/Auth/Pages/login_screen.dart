// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:loginsignup/Stacks/Auth/Pages/signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [
//               Color.fromARGB(255, 191, 22, 51), // Red
//               Color.fromARGB(255, 43, 24, 56), // Green
//             ],
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.width * .1),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Hello\nSign in!",
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Icon(Icons.more_horiz, size: 40, color: Colors.white),
//                 ],
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.width * .1),
//             Expanded(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Gmail",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                       ),
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: "Joydeo@gmail.com",
//                         suffixIcon: Icon(Icons.check, color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Password",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                       ),
//                     ),
//                     TextFormField(
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                         hintText: "********",
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "Forgot password?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Color.fromARGB(255, 43, 24, 56),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                    SizedBox(height: MediaQuery.of(context).size.width*.01),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           backgroundColor:
//                               Colors.transparent, // Make it transparent
//                           shadowColor:
//                               Colors.transparent, // Remove default shadow
//                         ),
//                         onPressed: () {},
//                         child: Ink(
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color.fromARGB(255, 191, 22, 51), // Red
//                                 Color.fromARGB(255, 43, 24, 56), // Green
//                               ], // Define your gradient colors
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Container(
//                             alignment: Alignment.center,
//                             constraints: const BoxConstraints(
//                                 minWidth: 100, minHeight: 50), // Adjust size
//                             child: const Text(
//                               "SIGN IN",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // const Spacer(),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.width*.3,
//                     ),
//                     Align(
//                       alignment:
//                           Alignment.bottomRight, // Ensures the text is centered
//                       child: RichText(
//                         textAlign: TextAlign.end, // Aligns text inside RichText
//                         text: TextSpan(
//                           text: "Don't have an account? ",
//                           style:
//                               const TextStyle(color: Colors.grey, fontSize: 14),
//                           children: [
//                             TextSpan(
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => SignupScreen()));
//                                 },
//                               text: "\nSign up",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 color: Color.fromARGB(255, 43, 24, 56),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/Stacks/Auth/Controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the LoginController
    final LoginController loginController = Get.put(LoginController());

    // Declare the TextEditingControllers in the screen
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Obx(() {
            // Watch the loading state
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Login", style: TextStyle(fontSize: 28, color: Colors.white)),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loginController.isLoading.value
                      ? null // Disable button when loading
                      : () {
                          // Pass the context and controllers to the login method
                          loginController.login( emailController, passwordController);
                        },
                  child: loginController.isLoading.value
                      ? const CircularProgressIndicator() // Show loading indicator
                      : const Text("Login"),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
