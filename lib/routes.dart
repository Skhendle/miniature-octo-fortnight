import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/pages/about.dart';
import 'package:flutter_spotify_africa_assessment/features/landing/presentation/pages/landing.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/application_layer/category_playlist/category_playlist_bloc.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotify_category_page.dart';

import 'features/spotify/application_layer/category_header/category_header_bloc.dart';

class AppRoutes {
  /// App start up (loading) page
  static const String startUp = '/';

  /// App start up (loading) page
  static const String about = '/about';

  /// Spotify Category Page
  static const String spotifyCategory = '/spotify/category';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LandingPage(),
          settings: settings,
        );
      case about:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AboutPage(),
          settings: settings,
        );
      case spotifyCategory:
        final String categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (BuildContext context) => MultiBlocProvider(
            providers: [
              BlocProvider<CategoryHeaderBloc>(
                create: (BuildContext context) => CategoryHeaderBloc(),
              ),
              BlocProvider<CategoryPlaylistBloc>(
                create: (BuildContext context) => CategoryPlaylistBloc(),
              ),
            ],
            child: SpotifyCategory(
              categoryId: categoryId,
            ),
          ),
          settings: settings,
        );
      /* TODO: handle other routes
      you can extract parameters from settings.arguments if necessary 
      https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments#alternatively-extract-the-arguments-using-ongenerateroute*/
      default:
        throw UnimplementedError();
    }
  }
}
