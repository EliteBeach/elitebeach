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
              color: Colors.white,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
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
        // Unit Details and contents
        ,
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          'Details',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          'Deluxe chalet available for up to 5 adults and 2 kids under 10 years old , contains master room with king size bed 160 cm and a room with 2 small beds 120 cm , kitchen , bathroom and reception',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: context.screenWidth * .035,
              fontFamily: 'EduAUVICWANTPre'),
        ),
      ],
    );
  }
}
