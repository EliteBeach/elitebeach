import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/gaps.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomPriceItem extends StatelessWidget {
  const CustomPriceItem({
    super.key,
    required this.price,
    required this.priceType,
  });
  final String price;
  final String priceType;

  @override
  Widget build(BuildContext context) {
    return ElasticInUp(
      child: Card(
        color: priceType == context.locale.translate('civilian')
            ? Colors.white
            : priceType == context.locale.translate('military')
                ? Colors.green[100]
                : Colors.green[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                priceType,
                style: TextStyle(
                  fontSize: context.screenWidth * .028,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'EduAUVICWANTPre',
                ),
              ),
              Gaps.vGap10,
              Text("$price  ${context.locale.translate('egp')}"),
            ],
          ),
        ),
      ),
    );
  }
}
