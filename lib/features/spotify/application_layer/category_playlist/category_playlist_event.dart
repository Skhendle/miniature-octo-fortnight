part of 'category_playlist_bloc.dart';

abstract class CategoryPlaylistEvent extends Equatable {
  const CategoryPlaylistEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryPlaylistEvent extends CategoryPlaylistEvent {
  final String categoryId;

  const GetCategoryPlaylistEvent({required this.categoryId});
}
