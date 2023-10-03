import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product.dart';
import '../screen/navBarScreen/productDetailScreen.dart';
import '../screen/utils/appColor.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.onRemove,
  }) : super(key: key);

  final Product product;
  final Function? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 140,
          child: InkWell(
            onTap: () {
              Get.to(ProductDetailScreen(
                productID: product.id!,
              ));
            },
            borderRadius: BorderRadius.circular(10),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: primaryColor.withOpacity(0.2),
              child: Column(
                children: [
                  Image.network(
                    product.image ?? '',
                    width: 132,
                    height: 90,
                    fit: BoxFit.scaleDown,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.title ?? 'Unknown',
                          style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.3,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                Text(
                                  '${product.star ?? 0}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: onRemove != null,
          child: Positioned(
            right: 0,
            top: 2,
            child: IconButton(
              onPressed: () {
                onRemove!();
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 14,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}