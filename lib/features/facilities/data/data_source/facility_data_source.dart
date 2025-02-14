import 'package:elite_beach/features/facilities/data/model/facility_model.dart';
import 'package:flutter/material.dart';

class FacilityDataSource {
  final List<FacilityModel> facilitiesData = [
    FacilityModel(
        facilityIcon: Icons.beach_access_rounded, facilityName: 'beach'),
    FacilityModel(
        facilityIcon: Icons.games_rounded, facilityName: 'arcade_zone'),
    FacilityModel(
        facilityIcon: Icons.child_care_rounded, facilityName: 'kids_Area'),
    FacilityModel(facilityIcon: Icons.mosque_rounded, facilityName: 'mosque'),
    FacilityModel(
        facilityIcon: Icons.dry_cleaning_rounded, facilityName: 'dry_cleaning'),
    FacilityModel(
        facilityIcon: Icons.local_parking_rounded,
        facilityName: 'on_site_parking'),
    FacilityModel(
        facilityIcon: Icons.sensor_door_rounded,
        facilityName: 'private_entrance'),
    FacilityModel(facilityIcon: Icons.pool_rounded, facilityName: 'aqua_park'),
    FacilityModel(facilityIcon: Icons.pool, facilityName: 'swimming_pool'),
    FacilityModel(
        facilityIcon: Icons.bathroom_rounded, facilityName: 'day_use_bathroom'),
    FacilityModel(
        facilityIcon: Icons.air_rounded, facilityName: 'air_conditioning'),
    FacilityModel(
        facilityIcon: Icons.shopping_bag_rounded, facilityName: 'super_market'),
    FacilityModel(
        facilityIcon: Icons.restaurant_rounded, facilityName: 'restaurant'),
    FacilityModel(
        facilityIcon: Icons.tv_rounded, facilityName: 'flat_screen_tv'),
    FacilityModel(
        facilityIcon: Icons.kitchen_rounded, facilityName: 'american_kitchen'),
    FacilityModel(
        facilityIcon: Icons.panorama_rounded,
        facilityName: 'panoramic_balcony'),
  ];
}
