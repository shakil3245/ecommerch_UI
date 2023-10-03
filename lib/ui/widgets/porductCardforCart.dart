import 'package:craftybay/ui/widgets/stepper_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/CartListModel.dart';
import '../../data/models/cartModel.dart';
import '../screen/stateManagement/CartController.dart';
import '../screen/utils/appColor.dart';

class productCard extends StatefulWidget {
  productCard({Key? key, required this.cartData}) : super(key: key);

  CartData cartData;

  @override
  State<productCard> createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Visibility(
              visible:  widget.cartData.product?.image != null,
              replacement: const SizedBox(
                width: 120,
                child: Center(
                  child: Text('No Image', style: TextStyle(
                      fontSize: 10
                  ),),
                ),
              ),
              child: Image.network(
                widget.cartData.product?.image ?? '',
                width: 120,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartData.product?.title ?? 'Unknown',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size: ${widget.cartData.size}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Color: ${widget.cartData.color}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.cartData.product?.price ?? '0.0'}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            fontSize: 16),
                      ),
                      ProductStepper(

                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}