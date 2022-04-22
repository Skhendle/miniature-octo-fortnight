import 'package:flutter_spotify_africa_assessment/features/spotify/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain_layer/catergory_header_model.dart';

class CatergoryHeaderAPI {
  Future<CategoryHeader> getPlaylistHeader(String categoryId) async {
    final request = await http
        .get(Uri.parse('${serverUrl}browse/categories/$categoryId/playlists'),
            headers: headers)
        .timeout(const Duration(seconds: 30))
        .catchError((e) {
      throw (['Network Connection Problem']);
    });

    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      return CategoryHeader(
          name: response['id'].toString().toUpperCase(),
          imageUrl: response['icons'][0]['url']);
    } else {
      throw ('Invalid Request');
    }
  }
}
