import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:loginsignup/Stacks/User/Pages/home_screen.dart';

class LoginController extends GetxController {
  // Loading state for UI
  var isLoading = false.obs;

  // Method to handle login
  Future<void> login( TextEditingController emailController, TextEditingController passwordController) async {
    isLoading.value = true;
    debugPrint('LoginController: Attempting to log in with email: ${emailController.text.trim()}');
    debugPrint('LoginController: Attempting to log in with password: ${passwordController.text.trim()}');

    // Show SnackBar with loading message
    Get.snackbar(
      'Logging In',
      'Please wait while we log you in...',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      isDismissible: false,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
    );
    try {
      final res = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (res.user != null) {
        Get.snackbar(
          'Success',
          'Login successful',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
        Get.offAll(() => const HomeScreen()); // Navigate to HomeScreen
      } else {
        Get.snackbar(
          'Error',
          'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      debugPrint('Login error: $e');
      Get.snackbar(
        'Login Error',
        'An error occurred. Please try again. $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }

    isLoading.value = false;
  }
}
