import 'package:get/get.dart';

class ProductSizeController extends GetxController {
  RxList<String> sizes = <String>['XS', 'S', 'M', 'L', 'XL'].obs;
  RxnString selectedSize = RxnString(); // Nullable String Rx

  void changeSize(String? value) {
    selectedSize.value = value;
  }
}
