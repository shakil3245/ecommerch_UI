import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/cartModel.dart';
import '../../widgets/elevetedButton.dart';
import '../../widgets/porductCardforCart.dart';
import '../stateManagement/CartController.dart';
import '../utils/appColor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartController.getCartList();
    });
  }

  CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<CartController>(builder: (cartController) {
        if (cartController.getCartListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    cartController.cartListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return productCard(
                    cartData: cartController.cartListModel.data![index],
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text('\$1000}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            )),
                      ],
                    ),
                    SizedBox(
                        width: 120,
                        child: elevetedButton(
                          Title: 'CheckOut',
                          onTap: () {},
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
