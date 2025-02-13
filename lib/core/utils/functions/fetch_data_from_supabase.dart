import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> fetchDataFromSupabase() async {
  SupabaseStreamFilterBuilder backViewRoomPrices = Supabase.instance.client
      .from('prices')
      .stream(primaryKey: ['back_view_room']);
}
