import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginsignup/Stacks/User/Models/product_model.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  setLoading(value){
    isLoading.value = value;
  }

 void fetchProducts() async {
    try {
      setLoading(true);
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        products.value = data.map((e) => Product.fromJson(e)).toList();
      }
    } catch (error) {
      debugPrint("Error fetching products: ${error.toString()}");
    } finally {
      setLoading(false);
    }
  }
}
