import 'package:flutter_spotify_africa_assessment/features/spotify/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain_layer/catergory_playlist_model.dart';

class CatergoryPlaylistsAPI {
  Future<List<CategoryPlaylist>> getCategoryPlaylists(String categoryId) async {
    final request = await http
        .get(Uri.parse('${serverUrl}browse/categories/$categoryId/playlists'),
            headers: headers)
        .timeout(const Duration(seconds: 30))
        .catchError((e) {
      throw ('Network Connection Problem');
    });

    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      var playLists = <CategoryPlaylist>[];
      var items = response['playlists']['items'];
      for (var item in items) {
        playLists.add(CategoryPlaylist(
            name: item['name'],
            description: item['description'],
            pictureURL: item['images'][0]['url'],
            playListID: item['id']));
      }
      return playLists;
    } else {
      throw ('Invalid Request');
    }
  }
}
