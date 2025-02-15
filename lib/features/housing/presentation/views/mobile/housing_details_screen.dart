import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/utils/gaps.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../data/models/housing_units.dart';
import '../../widgets/unit_data_widget_mobile.dart';

class HousingDetailsScreenMobile extends StatelessWidget {
  const HousingDetailsScreenMobile({
    super.key,
    required this.housingUnitModel,
  });
  final HousingUnitModel housingUnitModel;

  @override
  Widget build(BuildContext context) {
    // Fetch housing images
    final Stream<List<Map<String, dynamic>>> imagesStream = Supabase
        .instance.client
        .from('housing_images')
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .map((event) => event);

    // Fetch prices
    final Stream<List<Map<String, dynamic>>> pricesStream = Supabase
        .instance.client
        .from('prices')
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .map((event) => event);

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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: imagesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(child: Text('لا توجد صور متاحة'));
                  }

                  return SizedBox(
                    height: context.screenHeight * .4,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final imageUrl =
                            snapshot.data![index][housingUnitModel.title];
                        if (imageUrl == null || imageUrl.isEmpty) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Stack(
                                      children: [
                                        PhotoViewGallery.builder(
                                          itemCount: snapshot.data!.length,
                                          builder: (context, i) {
                                            return PhotoViewGalleryPageOptions(
                                              imageProvider: NetworkImage(
                                                  snapshot.data![i]
                                                      [housingUnitModel.title]),
                                              gestureDetectorBehavior:
                                                  HitTestBehavior.opaque,
                                            );
                                          },
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(Icons.arrow_back),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(child: Text('خطأ في التحميل')),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Gaps.vGap15,
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: pricesStream,
                builder: (context, snapshot) {
                  return snapshot.data == null
                      ? const Center(child: CircularProgressIndicator())
                      : UnitDataWidgetMobile(
                          unitData: housingUnitModel,
                          price0: snapshot.data![0][housingUnitModel.title],
                          price1: snapshot.data![1][housingUnitModel.title],
                          price2: snapshot.data![2][housingUnitModel.title],
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
