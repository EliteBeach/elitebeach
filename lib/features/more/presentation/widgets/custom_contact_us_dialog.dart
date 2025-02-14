import 'package:elite_beach/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/gaps.dart';

class CustomContactUsDialog extends StatelessWidget {
  const CustomContactUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //facebook
          InkWell(
            onTap: () {
              launchUrlString('https://www.facebook.com/EliteBeachElsokhna');
            },
            child: const Row(
              children: [
                Icon(
                  Icons.facebook_rounded,
                  color: Colors.blueAccent,
                ),
                Gaps.hGap5,
                Flexible(
                  child: Text(
                    'ELITE Beach - قرية وفندق إيليت بيتش',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.vGap30,
          //instagram
          InkWell(
            onTap: () {
              launchUrlString(
                  'https://www.instagram.com/elite_beach_resort_hotel');
            },
            child: Row(
              children: [
                Image.asset(
                  AssetsData.instagram,
                  fit: BoxFit.scaleDown,
                  height: 20,
                  width: 20,
                  color: Colors.deepOrangeAccent,
                ),
                Gaps.hGap5,
                const Flexible(
                  child: Text(
                    'ELITE Beach Resort & Hotel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.vGap30,
          //whatsApp
          InkWell(
            onTap: () {
              launchUrlString(
                  'https://api.whatsapp.com/send/?phone=%2B201003783804&text&type=phone_number&app_absent=0');
            },
            child: Row(
              children: [
                Image.asset(
                  AssetsData.whatsApp,
                  fit: BoxFit.scaleDown,
                  height: 20,
                  width: 20,
                  color: Colors.green,
                ),
                Gaps.hGap5,
                const Flexible(
                  child: Text(
                    '01003783804',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.vGap30,
          //call
          InkWell(
            onTap: () {
              launchUrlString('tel://01070607566');
            },
            child: Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.red[300],
                ),
                Gaps.hGap5,
                const Flexible(
                  child: Text(
                    '01070607566',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Gaps.vGap30,
        ],
      ),
    );
  }
}
