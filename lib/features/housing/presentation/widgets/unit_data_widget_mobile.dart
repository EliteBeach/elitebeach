import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/housing/presentation/widgets/custom_price_item.dart';
import 'package:flutter/material.dart';

class UnitDataWidgetMobile extends StatelessWidget {
  const UnitDataWidgetMobile({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // UNIT PRICES ROW
        Text(
          'Price',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
        SizedBox(
          height: context.screenHeight * .005,
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        const Row(children: [
          Expanded(
            flex: 2,
            child: CustomPriceItem(
              price: 2000,
              priceType: 'Civilian',
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomPriceItem(
              price: 1600,
              priceType: 'Military',
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomPriceItem(
              price: 1000,
              priceType: 'Electronic War House',
            ),
          ),
        ])
        // Unit capacity
        ,
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          'Capacity',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
        SizedBox(
          height: context.screenHeight * .005,
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          '5 Adults & 2 Kids under 10 years old',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          'Contents',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
        SizedBox(
          height: context.screenHeight * .005,
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          'Reception , master room , etc ....' * 10,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),

        SizedBox(
          height: context.screenHeight * .05,
        ),
      ],
    );
  }
}
