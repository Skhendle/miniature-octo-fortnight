import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/domain_layer/catergory_playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.color, required this.playlist})
      : super(key: key);
  final Color color;
  final CategoryPlaylist playlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(playlist.pictureURL),
                          fit: BoxFit.cover)))),
          Expanded(
              child: Center(
                  child: Text(playlist.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          )))),
          Expanded(
              child: Text('FOLLOWERS',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.normal, fontSize: 14)))
        ],
      ),
    );
  }
}
