import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/elevetedButton.dart';
import '../stateManagement/CartController.dart';
import '../stateManagement/authcontroller.dart';
import '../stateManagement/createReviewController.dart';

class CreateReviewPage extends StatelessWidget {

   CreateReviewPage({Key? key, required this.productId}) : super(key: key);
   final int productId;

  TextEditingController _firstNameETController = TextEditingController();
  TextEditingController _lastNameETController = TextEditingController();
  TextEditingController _commentETController = TextEditingController();
   CreateReviewController _reviewController = Get.put(CreateReviewController());
   AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reviews",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        elevation: 0.7,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(children: [
            SizedBox(height: 20,),
                TextField(
                  controller:_firstNameETController ,
                  decoration: InputDecoration(
                    hintText: "First Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: primaryColor
                      ),
                    ),
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _lastNameETController,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor
                      ),
                    ),
                    border: OutlineInputBorder(),

                  ),
                ),
            SizedBox(height: 15,),
            TextField(
              maxLines: 10,
              controller: _commentETController,
              decoration: InputDecoration(
                hintText: "Write Review",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor
                  ),
                ),
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(height: 20,),
            GetBuilder<CreateReviewController>(
              builder: (createReview) {
                return elevetedButton(Title: 'Submit', onTap: () async {
                  final result = await _authController.checkAuthValidation();
                  if(result){
                    _reviewController.CreateReview(productId,_commentETController.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sucessfully Added!")));

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add reviews!",),backgroundColor: Colors.red,));
                  }
                },);
              }
            ),

          ],),
        ),
      ),
    );
  }
}
