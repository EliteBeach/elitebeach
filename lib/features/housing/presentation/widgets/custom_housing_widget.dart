import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomHousingItemWidget extends StatelessWidget {
  const CustomHousingItemWidget(
      {super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: context.screenWidth * .4,
      // height: context.screenHeight * .3,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // margin: EdgeInsets.only(
            //   top: context.screenHeight * .15,
            // ),
            //    height: context.screenHeight * .07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent.withOpacity(.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    context.locale.translate(title)!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.screenWidth * .035,
                      // overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
