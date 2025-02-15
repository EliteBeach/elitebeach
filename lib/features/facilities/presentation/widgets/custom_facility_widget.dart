import 'package:flutter/material.dart';

class CustomFacilityWidget extends StatelessWidget {
  final String title;
  final List<FacilityItem> facilities;

  const CustomFacilityWidget({
    super.key,
    required this.title,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 20.0,
              runSpacing: 10.0,
              children: facilities
                  .map((facility) => Amenity(
                        icon: facility.icon,
                        text: facility.text,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilityItem {
  final IconData icon;
  final String text;

  FacilityItem({required this.icon, required this.text});
}

class Amenity extends StatelessWidget {
  final IconData icon;
  final String text;

  const Amenity({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24, color: Colors.grey[800]),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800]),
        ),
      ],
    );
  }
}
