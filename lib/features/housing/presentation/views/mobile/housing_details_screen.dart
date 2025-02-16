import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/utils/gaps.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../data/models/housing_units.dart';
import '../../widgets/unit_data_widget_mobile.dart';

class HousingDetailsScreenMobile extends StatefulWidget {
  const HousingDetailsScreenMobile({super.key, required this.housingUnitModel});
  final HousingUnitModel housingUnitModel;

  @override
  State<HousingDetailsScreenMobile> createState() =>
      _HousingDetailsScreenMobileState();
}

class _HousingDetailsScreenMobileState
    extends State<HousingDetailsScreenMobile> {
  late final Stream<List<Map<String, dynamic>>> _imagesStream;
  late final Stream<List<Map<String, dynamic>>> _pricesStream;

  @override
  void initState() {
    super.initState();
    _imagesStream = Supabase.instance.client
        .from('housing_images')
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .map((event) => event);

    _pricesStream = Supabase.instance.client
        .from('prices')
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .map((event) => event);
  }

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
                      color: Colors.transparent.withOpacity(.07),
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
          context.locale.translate(widget.housingUnitModel.title)!,
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
                stream: _imagesStream,
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
                        final imageUrl = snapshot.data![index]
                            [widget.housingUnitModel.title];
                        if (imageUrl == null ||
                            imageUrl.isEmpty ||
                            imageUrl == 'null') {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () => _openImageGallery(
                                context, snapshot.data!, index),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.scaleDown,
                              placeholder: (context, url) => Center(
                                child: Image.asset(AssetsData.eliteLogo),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: Image.asset(AssetsData.eliteLogo),
                              ),
                              fadeInDuration: const Duration(milliseconds: 300),
                              fadeOutDuration:
                                  const Duration(milliseconds: 300),
                              memCacheHeight: 150,
                              memCacheWidth: 150,
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
                stream: _pricesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError || snapshot.data == null) {
                    return const Center(child: Text('تعذر تحميل الأسعار'));
                  }

                  return UnitDataWidgetMobile(
                    unitData: widget.housingUnitModel,
                    price0: snapshot.data![0][widget.housingUnitModel.title] ??
                        'غير متاح',
                    price1: snapshot.data![1][widget.housingUnitModel.title] ??
                        'غير متاح',
                    price2: snapshot.data![2][widget.housingUnitModel.title] ??
                        'غير متاح',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openImageGallery(BuildContext context,
      List<Map<String, dynamic>> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: images.length,
                pageController: PageController(initialPage: initialIndex),
                builder: (context, index) {
                  String? fullImageUrl =
                      images[index][widget.housingUnitModel.title];

                  return PhotoViewGalleryPageOptions(
                    imageProvider: fullImageUrl != null &&
                            fullImageUrl.isNotEmpty &&
                            fullImageUrl != 'null'
                        ? NetworkImage(fullImageUrl)
                        : const AssetImage(AssetsData.eliteLogo)
                            as ImageProvider,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: fullImageUrl ?? 'default_tag'),
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AssetsData.eliteLogo),
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                  );
                },
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
