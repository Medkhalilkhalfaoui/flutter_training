import 'package:e_commerce_app/views/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/product_controller.dart';
import '../widgets/products_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: null,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back_outlined,color: Colors.black,),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          actions: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.search,color: Colors.black,),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.logout,color: Colors.black,),
              onPressed: () async {
                await authController.logout(context);



              },
            ),
            const SizedBox(width:10)
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Text("E-Commerce App", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
            ),
            // const Categories(),
             Expanded(
              child: ProductGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
