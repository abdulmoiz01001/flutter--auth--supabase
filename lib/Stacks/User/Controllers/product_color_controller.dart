import 'package:get/get.dart';

class ProductColorController extends GetxController{
  RxList<String> colors = ['black' , 'white' , 'green' , 'yellow' , 'brown' , 'pink'].obs;
  RxnString selectedColor = RxnString(); 

  void changeColor(String? value){
    selectedColor.value = value;
  }
}