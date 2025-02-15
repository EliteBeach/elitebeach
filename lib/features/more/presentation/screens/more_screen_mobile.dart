import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/gaps.dart';
import '../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../widgets/custom_contact_us_dialog.dart';
import '../widgets/custom_more_item.dart';
import '../widgets/custom_review_dialog.dart';

class MoreScreenMobile extends StatelessWidget {
  const MoreScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * .05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            duration: const Duration(seconds: 2),
            child: Row(
              children: [
                Image.asset(
                  AssetsData.eliteLogoNoBg,
                  width: context.screenWidth * .15,
                  height: context.screenHeight * .15,
                  color: Colors.black,
                ),
                const Spacer(),
                Text(
                  context.locale.translate('more')!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: context.screenWidth * .04,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    context.locale.isEnLocale
                        ? BlocProvider.of<LocaleCubit>(context).toArabic()
                        : BlocProvider.of<LocaleCubit>(context).toEnglish();
                  },
                  child: FadeIn(
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: EdgeInsets.all(context.screenHeight * .01),
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(
                            .07,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Icon(Icons.language_rounded),
                          SizedBox(
                            height: context.screenHeight * .01,
                          ),
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
                )
              ],
            ),
          ),
          SizedBox(
            height: context.screenHeight * .03,
          ),
          //Restaurant
          SizedBox(
            height: context.screenHeight * .7,
            child: ListView(
              shrinkWrap: true,
              children: [
                CustomMoreItem(
                  iconData: Icons.restaurant_rounded,
                  title: context.locale.translate('restaurant')!,
                  trailingIcon: Icons.menu_book_rounded,
                  tapHandler: () async {
                    final barMenuStream = Supabase.instance.client
                        .from('gallery_images')
                        .stream(primaryKey: ['id']).map((data) => data
                            .where((item) => item['rest_menu'] != null)
                            .toList()
                          ..sort((a, b) =>
                              a['id'].compareTo(b['id']))); // ترتيب البيانات

                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: barMenuStream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }

                              final data = snapshot.data ?? [];

                              if (data.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child:
                                      Center(child: Text('No menu available')),
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = data[index]['rest_menu'];

                                  if (imageUrl == null ||
                                      imageUrl.isEmpty ||
                                      imageUrl == 'null') {
                                    return const SizedBox(); // لو فاضي مش هيظهر حاجة
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: InteractiveViewer(
                                      child: Image.network(
                                        imageUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                              child:
                                                  Text('Error loading image'));
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  iconColor: Colors.green,
                ),

                Gaps.vGap10,
                //beverages
                CustomMoreItem(
                  iconData: Icons.emoji_food_beverage_sharp,
                  title: context.locale.translate('beverages')!,
                  trailingIcon: Icons.menu_book_rounded,
                  tapHandler: () async {
                    final barMenuStream = Supabase.instance.client
                        .from('gallery_images')
                        .stream(primaryKey: ['id']).map((data) => data
                            .where((item) => item['bar_menu'] != null)
                            .toList()
                          ..sort((a, b) =>
                              a['id'].compareTo(b['id']))); // ترتيب البيانات

                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: barMenuStream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }

                              final data = snapshot.data ?? [];

                              if (data.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child:
                                          Text('No beverages menu available')),
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = data[index]['bar_menu'];

                                  if (imageUrl == null ||
                                      imageUrl.isEmpty ||
                                      imageUrl == 'null') {
                                    return const SizedBox(); // لو فاضي مش هيظهر حاجة
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: InteractiveViewer(
                                      child: Image.network(
                                        imageUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                              child:
                                                  Text('Error loading image'));
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  iconColor: Colors.green,
                ),

                Gaps.vGap10,
                //super market
                CustomMoreItem(
                  iconData: Icons.shopping_cart_rounded,
                  title: context.locale.translate('super_market')!,
                  subtitle: context.locale.translate('sup_market_subtitle')!,
                  trailingIcon: Icons.call,
                  tapHandler: () {
                    launchUrlString("tel://01025617454");
                  },
                  iconColor: Colors.green,
                ),
                Gaps.vGap10,
                //telephone directory
                CustomMoreItem(
                  iconData: Icons.call,
                  title: context.locale.translate('tele_dir')!,
                  trailingIcon: Icons.contact_phone_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(AssetsData.teleDir),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
                Gaps.vGap10,
                //offers
                CustomMoreItem(
                  iconData: Icons.discount_rounded,
                  title: context.locale.translate('offers')!,
                  trailingIcon: Icons.money_off_rounded,
                  tapHandler: () {
                    final offersStream = Supabase.instance.client
                        .from('gallery_images')
                        .stream(primaryKey: ['id']).map((data) => data
                            .where((item) => item['offers'] != null)
                            .toList()
                          ..sort((a, b) =>
                              a['id'].compareTo(b['id']))); // ترتيب البيانات

                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: offersStream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }

                              final data = snapshot.data ?? [];

                              if (data.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child:
                                          Text('There are no offers for now')),
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = data[index]['offers'];

                                  if (imageUrl == null ||
                                      imageUrl.isEmpty ||
                                      imageUrl == 'null') {
                                    return const SizedBox(); // لو فاضي مش هيظهر حاجة
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: InteractiveViewer(
                                      child: Image.network(
                                        imageUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(child: Text(imageUrl));
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  iconColor: Colors.green,
                ),

                Gaps.vGap10,
                //down payment
                CustomMoreItem(
                  subtitle:
                      '${context.locale.translate('visa')!} / ${context.locale.translate('master_card')!} / ${context.locale.translate('cash')!}',
                  iconData: Icons.payment_rounded,
                  title: context.locale.translate('down_payment')!,
                  trailingIcon: Icons.attach_money_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                'https://i.imgur.com/WCVxm2U.jpeg'),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
                Gaps.vGap10,
                //contact_us
                CustomMoreItem(
                  iconData: Icons.connect_without_contact_rounded,
                  title: context.locale.translate('contact_us')!,
                  trailingIcon: Icons.contact_page_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const CustomContactUsDialog(),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
                Gaps.vGap10,
                //terms and conditions
                CustomMoreItem(
                  iconData: Icons.integration_instructions_rounded,
                  title: context.locale.translate('terms_conditions')!,
                  trailingIcon: Icons.policy_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: InteractiveViewer(
                                child: Image.asset(AssetsData.instructions)),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
                // Location
                Gaps.vGap10,
                CustomMoreItem(
                  iconData: Icons.location_on_rounded,
                  title: context.locale.translate('location')!,
                  trailingIcon: Icons.map_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Kilo 24 Ain Sokhna - Suez road\nالكيلو 24 طريق العين السخنة - السويس',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'EduAUVICWANTPre'),
                                  ),
                                  Gaps.vGap30,
                                  TextButton.icon(
                                    onPressed: () {
                                      launchUrlString(
                                          'https://www.google.com/maps/place/%D8%A5%D9%8A%D9%84%D9%8A%D8%AA+%D8%A8%D9%8A%D8%AA%D8%B4%E2%80%AD/@29.7936822,32.4457417,17z/data=!3m1!4b1!4m6!3m5!1s0x145635fbc0381535:0xcfe478c1ce0b894!8m2!3d29.7936822!4d32.4457417!16s%2Fg%2F11rgn92c4d?entry=ttu&g_ep=EgoyMDI1MDIxMS4wIKXMDSoJLDEwMjExMjM0SAFQAw%3D%3D');
                                    },
                                    label: const Text(
                                      'GO . .',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'EduAUVICWANTPre'),
                                    ),
                                    icon: const Icon(Icons.location_on_rounded),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                        Colors.green,
                                      ),
                                      elevation:
                                          const WidgetStatePropertyAll(6),
                                      iconColor: WidgetStatePropertyAll(
                                          Colors.green[50]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
                // Reviews
                Gaps.vGap10,
                CustomMoreItem(
                  iconData: Icons.reviews_rounded,
                  title: context.locale.translate('reviews')!,
                  trailingIcon: Icons.comment_rounded,
                  tapHandler: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const CustomReviewDialog(),
                          );
                        });
                  },
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),

          const Spacer(),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
