import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class CustomHousingItemWidget extends StatelessWidget {
  const CustomHousingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AssetsData.pool,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.screenWidth * .005),
          height: context.screenHeight * .07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent.withOpacity(.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'deluxe chalet',
                style: TextStyle(
                  fontSize: context.screenWidth * .028,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  //  fontFamily: 'EduAUVICWANTPre',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
