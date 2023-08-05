import 'package:craftybay/ui/screen/navBarScreen/review_Paga.dart';
import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/elevetedButton.dart';
import '../../widgets/productImage_Carosel.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Color> colors = [
    Color(0xFF000000),
    Color(0xFFDB231E),
    Color(0xFFA02D97),
    Color(0xFFF5EA12),
    Color(0xFF1903F6),
  ];

  Color _selectedColor = Color(0xFF000000);


  List<String> ProductSize = [
    "M",
    "L",
    "XL",
    "XXl",
    "XXL",
  ];

    String _selectedSize = "L";


  int _currentvalue = 0;
  late TextEditingController _stepperTEController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stepperTEController = TextEditingController(text: "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              productImageCarosel(),
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
                        const Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Happy new year special Deal save 30%",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
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
                                      borderRadius: BorderRadius.circular(6)),
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
                                    fontSize: 22, fontWeight: FontWeight.w600),
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
                          "4.8",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: grayColor.withOpacity(0.8)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                              onPressed: () {
                                Get.to(ReviewPage());
                              },
                              child: const Text(
                                "Reviews",
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        )
                      ],
                    ),
                    Text("Color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.6)),),
                    SizedBox(height: 10,),

                    Row(
                      children: colors.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: (){
                              if(_selectedColor != colors) {
                                _selectedColor = e;
                                if (mounted) {
                                  setState(() {

                                  });
                                }
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: e,
                              radius: 15,
                              child:  Visibility(
                                  visible: e == _selectedColor,
                                  child: Icon(Icons.check)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),
                    Text("Size",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.6)),),
                    SizedBox(height: 10,),
                    Row(
                      children: ProductSize.map((size) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: (){
                                if(_selectedSize != ProductSize) {
                                  _selectedSize = size;
                                  if (mounted) {
                                    setState(() {

                                    });
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: size == _selectedSize ? primaryColor : null,
                                    border: Border.all(
                                        color: Colors.grey
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(size, style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: size == _selectedSize
                                          ? Colors.white
                                          : null),),
                                ),
                              )
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),
                    Text("Description",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.6)),),
                    SizedBox(height: 10,),
                    Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")

                  ],
                ),
              )
            ],),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      Text("\$100",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor),),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                      child: elevetedButton(Title: 'Add to card', onTap: () {},)),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
