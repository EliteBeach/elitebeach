import 'package:elite_beach/core/utils/gaps.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/facility_data_source.dart';

class CustomFacilityWidget extends StatelessWidget {
  const CustomFacilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FacilityDataSource facilities = FacilityDataSource();
    return Expanded(
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.translate('great_for_your_stay')!,
                style: TextStyle(
                  fontSize: context.screenWidth * .03,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'EduAUVICWANTPre',
                ),
              ),
              Gaps.vGap15,
              Flexible(
                  child: GridView.builder(
                shrinkWrap: true,
                itemCount: facilities.facilitiesData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  childAspectRatio: 3,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        facilities.facilitiesData[index].facilityIcon,
                        color: Colors.green[500],
                      ),
                      Gaps.hGap5,
                      Flexible(
                        child: Text(
                          context.locale.translate(
                            facilities.facilitiesData[index].facilityName,
                          )!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'EduAUVICWANTPre',
                          ),
                        ),
                      ),
                      Gaps.hGap12,
                    ],
                  );
                },
              )
                  // ListView(
                  //   children: [
                  //     Text(
                  //       context.locale.translate('great_for_your_stay')!,
                  //       style: TextStyle(
                  //         fontSize: context.screenWidth * .03,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: 'EduAUVICWANTPre',
                  //       ),
                  //     ),
                  //     Gaps.vGap15,
                  //     Row(
                  //       children: [
                  //         //TV
                  //         const Icon(
                  //           Icons.tv_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('flat_screen_tv')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //Parking
                  //         const Icon(
                  //           Icons.local_parking_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('on_site_parking')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //kitchen
                  //         const Icon(
                  //           Icons.kitchen_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('american_kitchen')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //       ],
                  //     ),
                  //     Gaps.vGap15,
                  //     Row(
                  //       children: [
                  //         //TV
                  //         const Icon(
                  //           Icons.tv_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('flat_screen_tv')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //Parking
                  //         const Icon(
                  //           Icons.local_parking_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('on_site_parking')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //kitchen
                  //         const Icon(
                  //           Icons.kitchen_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('american_kitchen')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //       ],
                  //     ),
                  //     Gaps.vGap15,
                  //     Row(
                  //       children: [
                  //         //TV
                  //         const Icon(
                  //           Icons.tv_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('flat_screen_tv')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //Parking
                  //         const Icon(
                  //           Icons.local_parking_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('on_site_parking')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //         //kitchen
                  //         const Icon(
                  //           Icons.kitchen_rounded,
                  //         ),
                  //         Gaps.hGap5,
                  //         Flexible(
                  //           child: Text(
                  //             context.locale.translate('american_kitchen')!,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'EduAUVICWANTPre',
                  //             ),
                  //           ),
                  //         ),
                  //         Gaps.hGap12,
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  )
            ],
          ),
        ),
      ),
    );
  }
}
