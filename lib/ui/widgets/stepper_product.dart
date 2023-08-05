
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class ProductStepper extends StatelessWidget {
  ProductStepper({Key? key}) : super(key: key);

  int _currentvalue = 0;
  late TextEditingController _stepperTEController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //for increase counter
      InkWell(
        onTap: (){
          if(_currentvalue>1){
            _currentvalue--;
            _stepperTEController.text = _currentvalue.toString();
          }
        },
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6)

            ),
            child: Center(
                child: Icon(Icons.remove,color: Colors.white,size: 18,)
            )
        ),
      ),
      SizedBox(width: 50,
        child: TextField(
          controller: _stepperTEController,
          enabled: false,
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              )
          ),
        ),),
      //for decrease counter
      InkWell(
        onTap: (){
          if(_currentvalue<20){
            _currentvalue++;
            _stepperTEController.text = _currentvalue.toString();
          }
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(6)

          ),
          child:  Icon(Icons.add,color: Colors.white,size: 18,),
        ),
      ),

    ],);
  }
}
