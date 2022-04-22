import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/domain_layer/catergory_playlist_model.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/components/artist_card.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/components/song_card.dart';

class SpotifyPlaylist extends StatefulWidget {
  const SpotifyPlaylist({Key? key, required this.playlist}) : super(key: key);
  final CategoryPlaylist playlist;

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.playlist.pictureURL),
                        fit: BoxFit.fill)),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(widget.playlist.description.split(":")[0],
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16)),
                  )),
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                    text: TextSpan(
                  text: '149, 156 likes ',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: '- Time',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.green,
                          fontSize: 16),
                    ),
                  ],
                )),
              ),
              Container(
                  height: 300,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SongCard(
                          imageURL: widget.playlist.pictureURL,
                          name: widget.playlist.name,
                        );
                      })),
              Container(
                  height: 250,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ArtistCard(
                          imageURL: widget.playlist.pictureURL,
                          name: widget.playlist.name,
                        );
                      })),
            ]),
          ),
        ],
      ),
    );
  }
}
