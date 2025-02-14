import 'package:elite_beach/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../models/housing_units.dart';

class HousingUnitDataSource {
  List<HousingUnitModel> housingUnitsData = [
    HousingUnitModel(
      id: 0,
      title: 'deluxe_chalet',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'deluxe_chalet_capacity_txt',
      contents: '',
      unitImages: [
        AssetsData.testHousing1,
        AssetsData.pool,
        AssetsData.testHousing1,
        AssetsData.pool,
        AssetsData.testHousing1,
        AssetsData.pool,
      ],
      description: [
        {
          'title': 'deluxe_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'sofa_bed',
          'icon': Icons.chair_rounded,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'panoramic_balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
        {
          'title': 'american_kitchen',
          'icon': Icons.kitchen_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 1,
      title: 'standard_chalet',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'chalet_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'standard_chalet_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'sofa_bed',
          'icon': Icons.chair_rounded,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'walk_in_balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
        {
          'title': 'american_kitchen',
          'icon': Icons.kitchen_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 2,
      title: 'studio',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'studio_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'studio_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'walk_in_balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
        {
          'title': 'kitchenette',
          'icon': Icons.kitchen_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 3,
      title: 'sea_view_triple_room',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'triple_room_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'triple_room_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 4,
      title: 'sea_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'double_room_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'sea_double_room_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 5,
      title: 'side_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'double_room_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'side_double_room_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'balcony',
          'icon': Icons.remove_red_eye_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
      ],
    ),
    HousingUnitModel(
      id: 6,
      title: 'back_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      capacity: 'double_room_capacity_txt',
      contents: '',
      unitImages: [],
      description: [
        {
          'title': 'back_double_room_bedding',
          'icon': Icons.bed,
        },
        {
          'title': 'size',
          'icon': Icons.aspect_ratio_rounded,
        },
        {
          'title': 'private_bathroom',
          'icon': Icons.shower_rounded,
        },
        {
          'title': 'air_conditioning',
          'icon': Icons.air_rounded,
        },
        {
          'title': 'flat_screen_tv',
          'icon': Icons.tv_rounded,
        },
      ],
    ),
  ];
}
