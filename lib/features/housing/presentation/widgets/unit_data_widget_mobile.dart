import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/housing/presentation/widgets/custom_price_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/housing_units.dart';

class UnitDataWidgetMobile extends StatelessWidget {
  const UnitDataWidgetMobile({super.key, required this.unitData});
  final HousingUnitModel unitData;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // UNIT PRICES ROW
        Text(
          context.locale.translate('price')!,
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

        Row(children: [
          Expanded(
            flex: 4,
            child: CustomPriceItem(
              price: unitData.civilianPrice,
              priceType: context.locale.translate('civilian')!,
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomPriceItem(
              price: unitData.militaryPrice,
              priceType: context.locale.translate('military')!,
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomPriceItem(
              price: unitData.ewhPrice,
              priceType: context.locale.translate('e_w_h')!,
            ),
          ),
        ]),
        // Unit capacity

        SizedBox(
          height: context.screenHeight * .01,
        ),
        Text(
          context.locale.translate('capacity')!,
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
          context.locale.translate(unitData.capacity)!,
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
          context.locale.translate('contents')!,
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
          'demo text for contents..' * 10,
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
