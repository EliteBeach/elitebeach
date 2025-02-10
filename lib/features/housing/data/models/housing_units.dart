class HousingUnitModel {
  final int id;
  final String title;
  final String gridImagePath;
  final List<String> unitImages;
  final String description;

  HousingUnitModel({
    required this.id,
    required this.title,
    required this.gridImagePath,
    required this.unitImages,
    required this.description,
  });
}
