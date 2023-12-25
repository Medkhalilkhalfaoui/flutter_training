import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product.dart';
import '../../models/product_model.dart';
import '../widgets/cart_counter.dart';
import '../widgets/color_dot.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[

            IconButton(
              icon: SvgPicture.asset("assets/icons/cart.svg",colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),),
              onPressed: () {},
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    product.image!,
                    width:size.width*0.6,
                    height:size.height*0.3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      product.title!,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Price",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    //SizedBox(height: size.height*0.17),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           const Text("Color"),
                    //           Row(
                    //             children: const [
                    //               ColorDot(
                    //                 color: Color(0xFF356C95),
                    //                 isSelected: true,
                    //               ),
                    //               ColorDot(
                    //                 color: Color(0xFFF8C078),
                    //                 isSelected: true,
                    //               ),
                    //               ColorDot(color: Color(0xFFA29B9B), isSelected: false),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: RichText(
                    //         text: TextSpan(
                    //           style: const TextStyle(color: Color(0xFF535353)),
                    //           children: [
                    //             const TextSpan(text: "Size\n"),
                    //             TextSpan(
                    //               text: "${product.size} cm",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleLarge!
                    //                   .copyWith(fontWeight: FontWeight.bold),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        product.description!,
                        style: const TextStyle(height: 1.5),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CartCounter(),
                        Row(
                          children: [
                            Text(product!.rating!.rate.toString()),
                            Icon(Icons.star,color: Colors.amber,),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/add_to_cart.svg",
                                colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                backgroundColor: Colors.blue,
                              ),
                              child: Text(
                                "Buy  Now".toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

              )



            ],
          ),
        ),
      ),
    );
  }
}
