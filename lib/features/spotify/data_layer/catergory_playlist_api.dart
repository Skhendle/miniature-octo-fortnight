import 'package:flutter_spotify_africa_assessment/features/spotify/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain_layer/catergory_playlist_model.dart';

class CatergoryPlaylistsAPI {
 Future<CategoryPlaylist> _fullPlaylistInfo(String playlistId) async {
    final request = await http
        .get(Uri.parse('${serverUrl}playlists/$playlistId'), headers: headers)
        .timeout(const Duration(seconds: 30))
        .catchError((e) {
      throw ('Network Connection Problem');
    });

    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      return CategoryPlaylist(
          name: response['name'],
          description: response['description'],
          pictureURL: response['images'][0]['url'],
          playListID: response['id'],
          followers: response['followers']['total'].toString());
    } else {
      throw ('Invalid Request');
    }
  }

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
        var playlistData = await _fullPlaylistInfo(item['id'].toString());
        playLists.add(playlistData);
      }
      return playLists;
    } else {
      throw ('Invalid Request');
    }
  }

}
