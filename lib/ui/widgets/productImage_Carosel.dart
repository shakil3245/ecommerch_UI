import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class productImageCarosel extends StatelessWidget {

  final ValueNotifier<int> _carrentindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index,_){
              _carrentindex.value = index;
            },
            height:220,
            autoPlay: false,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.ease,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
          ),
          items: [1,2,3,4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ValueListenableBuilder(
                  valueListenable: _carrentindex,
                  builder: (context,currentValue,_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<4;i++)
                          Padding(
                              padding: const EdgeInsets.all(4),
                              child:Container(
                                height: 11,
                                width: 11,
                                decoration: BoxDecoration(
                                  color: currentValue == i? primaryColor: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                          ),

                      ],);
                  }
              ),
            ),
          ),
        ),
      ],
    );
  }
}
