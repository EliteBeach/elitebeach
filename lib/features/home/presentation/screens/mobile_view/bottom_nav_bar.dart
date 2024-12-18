import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/bottom_nav_cubit_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 4) {
          BlocProvider.of<BottomNavCubit>(context).showMore();
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        fontSize: context.screenWidth * .028,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'EduAUVICWANTPre',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: context.screenWidth * .028,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'EduAUVICWANTPre',
      ),
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          label: context.locale.translate('home')!,
          icon: const Icon(
            Icons.home_max_rounded,
          ),
        ),
        BottomNavigationBarItem(
          label: context.locale.translate('about')!,
          icon: const Icon(
            Icons.mode_edit_rounded,
          ),
        ),
        BottomNavigationBarItem(
          label: context.locale.translate('gallery')!,
          icon: const Icon(
            Icons.photo_album_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: context.locale.translate('units')!,
          icon: const Icon(
            Icons.villa_outlined,
          ),
        ),
        // BottomNavigationBarItem(
        //   label: context.locale.translate('offers')!,
        //   icon: const Icon(
        //     Icons.local_offer_rounded,
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   label: context.locale.translate('rest&bar')!,
        //   icon: const Icon(
        //     Icons.restaurant_rounded,
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   label: context.locale.translate('facilities')!,
        //   icon: const Icon(
        //     Icons.supervised_user_circle_rounded,
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   label: context.locale.translate('weeding&events')!,
        //   icon: const Icon(
        //     Icons.event_available_rounded,
        //   ),
        // ),
        BottomNavigationBarItem(
          label: 'More',
          icon: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
            builder: (context, state) {
              return BlocProvider.of<BottomNavCubit>(context).isActive
                  ? const Icon(
                      Icons.arrow_upward_outlined,
                    )
                  : const Icon(
                      Icons.arrow_downward_outlined,
                    );
            },
          ),
        ),
      ],
    );
  }
}
