class HousingUnitModel {
  final int id;
  final String title;
  final String gridImagePath;

  final String capacity;
  final String contents;

  final List<Map<String, dynamic>> description;

  HousingUnitModel(
      {required this.id,
      required this.title,
      required this.gridImagePath,
      required this.capacity,
      required this.contents,
      required this.description});
}
