import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/data_layer/catergory_playlist_api.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/domain_layer/catergory_playlist_model.dart';

part 'category_playlist_event.dart';
part 'category_playlist_state.dart';

class CategoryPlaylistBloc
    extends Bloc<CategoryPlaylistEvent, CategoryPlaylistState> {
  CategoryPlaylistBloc() : super(CategoryPlaylistInitial()) {
    on<GetCategoryPlaylistEvent>(_oneGetPlaylistCategoriesHeader);
  }
  final CatergoryPlaylistsAPI repo = CatergoryPlaylistsAPI();

  Future<void> _oneGetPlaylistCategoriesHeader(GetCategoryPlaylistEvent event,
      Emitter<CategoryPlaylistState> emit) async {
    try {
      var data = await repo.getCategoryPlaylists(event.categoryId);
      emit(CategoryPlaylistView(data: data));
    } catch (e) {
      emit(CategoryPlaylistError(messgae: e.toString()));
    }
  }
}
