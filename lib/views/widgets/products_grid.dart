import 'package:e_commerce_app/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../models/product.dart';
import '../screens/product_detail_page.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({super.key});
  final ProductController productController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.productList.isNotEmpty?GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      itemCount: productController.productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => ItemCard(
        product: productController.productList[index],
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: productController.productList[index],
            ),
          ),
        ),
        // press: () => Navigator.pushNamed(
        //   context,
        //   'details',
        //   arguments: products[index]
        // ),

      ),
    ):const Center(child: CircularProgressIndicator(),));
  }
}
