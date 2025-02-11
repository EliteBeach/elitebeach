import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/housing/presentation/widgets/unit_data_widget_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../../core/utils/gaps.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../data/models/housing_units.dart';

class HousingDetailsScreenMobile extends StatelessWidget {
  const HousingDetailsScreenMobile({
    super.key,
    required this.housingUnitModel,
  });
  final HousingUnitModel housingUnitModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB0BDC0),
      appBar: AppBar(
        toolbarHeight: context.screenHeight * .12,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                context.locale.isEnLocale
                    ? BlocProvider.of<LocaleCubit>(context).toArabic()
                    : BlocProvider.of<LocaleCubit>(context).toEnglish();
              },
              child: FadeInDown(
                duration: const Duration(seconds: 3),
                child: Container(
                  padding: EdgeInsets.all(context.screenHeight * .01),
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(
                        .07,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.language_rounded),
                      Text(
                        context.locale.isEnLocale ? 'ع' : 'En',
                        style: TextStyle(
                          fontSize: context.screenWidth * .025,
                          letterSpacing: context.locale.isEnLocale
                              ? context.screenWidth * .005
                              : null,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          //  fontFamily: 'EduAUVICWANTPre',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xffB0BDC0),
        centerTitle: true,
        title: Text(
          context.locale.translate(housingUnitModel.title)!,
          style: TextStyle(
            fontSize: context.screenWidth * .04,
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            //  fontFamily: 'EduAUVICWANTPre',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.screenHeight * .4,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: housingUnitModel.unitImages.length,
                    padding: EdgeInsetsDirectional.only(
                        start: context.locale.isEnLocale ? 0 : 10,
                        end: !context.locale.isEnLocale ? 0 : 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Stack(
                                    children: [
                                      PhotoViewGallery.builder(
                                        // enableRotation: true,
                                        itemCount:
                                            housingUnitModel.unitImages.length,
                                        builder: (context, index) {
                                          return PhotoViewGalleryPageOptions(
                                              imageProvider: AssetImage(
                                                housingUnitModel
                                                    .unitImages[index],
                                              ),
                                              gestureDetectorBehavior:
                                                  HitTestBehavior.opaque);
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.arrow_back)),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                          child: Image.asset(
                            housingUnitModel.unitImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              Gaps.vGap15,
              UnitDataWidgetMobile(
                unitData: housingUnitModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
