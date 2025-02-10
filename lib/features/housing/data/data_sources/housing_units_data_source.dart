import 'package:elite_beach/core/utils/assets.dart';

import '../models/housing_units.dart';

class HousingUnitDataSource {
  List<HousingUnitModel> housingUnitsData = [
    HousingUnitModel(
      id: 0,
      title: 'deluxe_chalet',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [
        AssetsData.testHousing1,
        AssetsData.pool,
        AssetsData.testHousing1,
        AssetsData.pool,
        AssetsData.testHousing1,
        AssetsData.pool,
      ],
    ),
    HousingUnitModel(
      id: 1,
      title: 'standard_chalet',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
    HousingUnitModel(
      id: 2,
      title: 'studio',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
    HousingUnitModel(
      id: 3,
      title: 'sea_view_triple_room',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
    HousingUnitModel(
      id: 4,
      title: 'sea_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
    HousingUnitModel(
      id: 5,
      title: 'side_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
    HousingUnitModel(
      id: 6,
      title: 'back_view_double_room',
      gridImagePath: AssetsData.testHousing1,
      description: '',
      unitImages: [],
    ),
  ];
}
