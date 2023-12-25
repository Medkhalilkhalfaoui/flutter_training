import 'dart:convert';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/screens/login_page.dart';

class ProductController extends GetxController{
  RxList<ProductModel> productList =  <ProductModel>[].obs;



  fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List<ProductModel> listProducts = ProductModel.listFromJson(result);
      productList.value = listProducts;
      print(productList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

}