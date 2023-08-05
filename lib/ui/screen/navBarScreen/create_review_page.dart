import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/elevetedButton.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({Key? key}) : super(key: key);

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
            elevetedButton(Title: 'Submit', onTap: () {  },),

          ],),
        ),
      ),
    );
  }
}
