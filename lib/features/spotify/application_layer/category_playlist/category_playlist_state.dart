part of 'category_playlist_bloc.dart';

abstract class CategoryPlaylistState extends Equatable {
  const CategoryPlaylistState();
  
  @override
  List<Object> get props => [];
}

class CategoryPlaylistInitial extends CategoryPlaylistState {}
