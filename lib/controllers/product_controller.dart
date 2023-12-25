import 'dart:convert';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{
  List<ProductModel> productList =  <ProductModel>[].obs;



  fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List<ProductModel> listProducts = ProductModel.listFromJson(result);
      productList = listProducts;
      print(productList);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}