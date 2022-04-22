part of 'category_playlist_bloc.dart';

abstract class CategoryPlaylistState extends Equatable {
  const CategoryPlaylistState();

  @override
  List<Object> get props => [];
}

class CategoryPlaylistInitial extends CategoryPlaylistState {}

class CategoryPlaylistView extends CategoryPlaylistState {
  final List<CategoryPlaylist> data;
  const CategoryPlaylistView({required this.data}) : super();
}

class CategoryPlaylistError extends CategoryPlaylistState {
  final String messgae;
  const CategoryPlaylistError({required this.messgae}) : super();
}
