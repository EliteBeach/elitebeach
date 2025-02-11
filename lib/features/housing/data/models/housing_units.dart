class HousingUnitModel {
  final int id;
  final String title;
  final String gridImagePath;
  final List<String> unitImages;
  final String capacity;
  final String contents;
  final String civilianPrice;
  final String militaryPrice;
  final String ewhPrice;

  HousingUnitModel({
    required this.id,
    required this.title,
    required this.gridImagePath,
    required this.unitImages,
    required this.capacity,
    required this.contents,
    required this.civilianPrice,
    required this.militaryPrice,
    required this.ewhPrice,
  });
}
