import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUser(String name, String email, String password, String role) async {
    isLoading.value = true;
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: <String,dynamic >{
          'full_name': name,
          'role': role,
        },
      );

      if (response.user != null) {
        Get.snackbar("Success", "Account created! Please verify your email.");
      } else {
        Get.snackbar("Error", "Something went wrong. Try again.");
      }
    } on AuthException catch (e) {
      Get.snackbar("Auth Error", e.message);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
