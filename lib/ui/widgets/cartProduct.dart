//
// import 'package:craftybay/ui/widgets/stepper_product.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../data/models/CartListModel.dart';
// import '../screen/utils/appColor.dart';
//
// class cartProduct extends StatelessWidget {
//   const cartProduct({
//     super.key, required this.cartData,
//   });
//  final CartData cartData;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
//       child: Card(child: Row(children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(width: 80,height: 100,
//             child: Image.network(cartData.product?.image ?? "",fit: BoxFit.fill)),
//         ),
//         SizedBox(width: 16,),
//         Column(children: [
//           Row(children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(cartData.product?.title?? "",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
//                 Text("Color :${cartData.color} , Size: ${cartData.size}",style: TextStyle(fontSize: 12),),
//               ],),
//             SizedBox(width:50 ,),
//             IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
//           ],),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("\$${cartData.product?.price?? ""}",style: TextStyle(fontSize: 18,color: primaryColor),),
//               SizedBox(width: 100,),
//               ProductStepper(),
//             ],)
//         ],)
//
//       ],),),
//     );
//   }
// }
