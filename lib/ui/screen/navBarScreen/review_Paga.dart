import 'package:craftybay/ui/screen/utils/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/reviewCard.dart';
import '../stateManagement/reviewController.dart';
import 'create_review_page.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  ReviewController _reviewController = Get.put(ReviewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {_reviewController.reviewList(widget.productId); });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        elevation: 0.7,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8),
              //     child: GetBuilder<ReviewController>(builder: (reviewController) {
              //       if (reviewController.getWishListInProgress) {
              //         Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //       return Column(children: [
              //         GridView.builder(
              //           itemCount:reviewController.allReviewList.ReviewData?.length ?? 0 ,
              //             shrinkWrap: true,
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 1
              //             ),
              //             itemBuilder: (context, index) {
              //               return reviewsCard(userName:reviewController.allReviewList.ReviewData![index].profile!.firstName! , Description: reviewController.allReviewList.ReviewData![index]!.description!);
              //             }
              //             )
              //       ]);
              //     }),
              //   ),
              // ),
              Positioned(
                bottom: 10,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: primaryColor.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("(1000)"),
                        Spacer(),
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            onPressed: () {
                              Get.to(CreateReviewPage(productId: widget.productId,));
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
