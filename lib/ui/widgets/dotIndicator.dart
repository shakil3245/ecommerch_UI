import 'package:flutter/material.dart';

import '../screen/utils/appColor.dart';

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    Key? key,
    required ValueNotifier<int> carrentindex,
  }) : _carrentindex = carrentindex, super(key: key);

  final ValueNotifier<int> _carrentindex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
                        color: currentValue == i? primaryColor: null,
                        border: Border.all(color: grayColor.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                ),

            ],);
        }
    );
  }
}
