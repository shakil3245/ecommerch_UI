import 'package:craftybay/ui/screen/navBarScreen/review_Paga.dart';
import 'package:craftybay/ui/screen/stateManagement/addTowishList.dart';
import 'package:craftybay/ui/screen/stateManagement/authcontroller.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/elevetedButton.dart';
import '../../widgets/productImage_Carosel.dart';
import '../stateManagement/CartController.dart';
import '../stateManagement/productDetailsController.dart';


class ProductDetailScreen extends StatefulWidget {
  final int productID;
  const ProductDetailScreen({Key? key, required this.productID})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Color> colors = [];

  Color? _selectedColor;

  List<String> ProductSize = [];

  String? _selectedSize;

  int _currentvalue = 0;
  late TextEditingController _stepperTEController;
  ProductDetailController _productDetailController =
      Get.put(ProductDetailController());
  WishListControllers _wishListController = Get.put(WishListControllers());
  AuthController _authController = Get.put(AuthController());
  CartController _addToCardController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailController.getProductDetails(widget.productID);
    });
    _stepperTEController = TextEditingController(text: "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<ProductDetailController>(builder: (ProductDetail) {
        if (ProductDetail.getCategoryInProgress) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }

        final productDetails =
            ProductDetail.productDetailModel.productData!.first;

        ProductSize = getSize(productDetails.size!);
        colors = getColors(productDetails.color!);

        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  productImageCarosel(
                    images: [
                      productDetails.img1 ?? "",
                      productDetails.img2 ?? "",
                      productDetails.img3 ?? "",
                      productDetails.img4 ?? "",
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  productDetails.product?.title ?? "Unknown",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                            Row(
                              children: [
                                //for increase counter
                                InkWell(
                                  onTap: () {
                                    if (_currentvalue > 1) {
                                      _currentvalue--;
                                      _stepperTEController.text =
                                          _currentvalue.toString();
                                    }
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 18,
                                      ))),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: _stepperTEController,
                                    enabled: false,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                                  ),
                                ),
                                //for decrease counter
                                InkWell(
                                  onTap: () {
                                    if (_currentvalue < 20) {
                                      _currentvalue++;
                                      _stepperTEController.text =
                                          _currentvalue.toString();
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${productDetails.product?.star ?? 0}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: grayColor.withOpacity(0.8)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextButton(
                                  onPressed: () {
                                    Get.to(ReviewPage(
                                      productId: productDetails.product!.id!,
                                    ));
                                  },
                                  child: const Text(
                                    "Reviews",
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            GetBuilder<WishListControllers>(
                                builder: (WishList) {
                              if (WishList.getWishListInProgree) {
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  _wishListController
                                      .addToWishlist(productDetails.productId!);
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: colors.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  if (_selectedColor != colors) {
                                    _selectedColor = e;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: e,
                                  radius: 15,
                                  child: Visibility(
                                      visible: e == _selectedColor,
                                      child: Icon(Icons.check)),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: ProductSize.map((size) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_selectedSize != ProductSize) {
                                      _selectedSize = size;
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: size == _selectedSize
                                            ? primaryColor
                                            : null,
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: size == _selectedSize
                                                ? Colors.white
                                                : null),
                                      ),
                                    ),
                                  )),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
                        /*Text(
                          productDetails.product!.shortDes ?? '',style: TextStyle(fontSize: 14),
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$${productDetails.product!.price}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 120,
                        child: GetBuilder<CartController>(builder: (addToCard) {
                          if (addToCard.getWishListInProgree) {
                            Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return elevetedButton(
                            Title: 'Add to card',
                            onTap: () async {
                              final result =
                                  await _authController.checkAuthValidation();
                              if (result) {
                                if (_selectedSize != null &&
                                    _selectedColor != null) {
                                  _addToCardController.addToCardlist(
                                      productDetails.product!.id!,
                                      _getHexCode(_selectedColor!),
                                      _selectedSize!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Sucessfully Added!")));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Select color and size!",
                                    ),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              }
                            },
                          );
                        })),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  //split teh size that came form API
  List<String> getSize(String size) {
    return size.split(',');
  }

  //make the hexcolor to dartCOLOR   Api
  List<Color> getColors(String color) {
    List<Color> hexColors = [];
    List<String> colors = color.split(',');
    for (String c in colors) {
      c = c.replaceAll('#', '0xFF');
      hexColors.add(Color(int.parse(c)));
    }
    return hexColors;
  }

  // make the DartColor  into api hexcolor
  String _getHexCode(Color color) {
    return color
        .toString()
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }
}
