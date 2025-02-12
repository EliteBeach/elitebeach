import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> fetchImages({required String folderName}) async {
  List<String> imageUrls = [];

  const String cloudName = 'dzdixrbgm';
  const String apiKey = '572165443159146';
  const String apiSecret = 'WwSYl35htfcfjhrVwjfqktV4Du8';

  String apiUrl =
      "https://api.cloudinary.com/v1_1/$cloudName/resources/image/upload?type=upload&prefix=$folderName";

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}',
    },
  );
  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final resources = data['resources'] as List<dynamic>;

    imageUrls =
        resources.map((resource) => resource['secure_url'] as String).toList();
  } else {
    throw Exception('Failed to load images');
  }
  return imageUrls;
}
