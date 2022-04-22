import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_playlist_event.dart';
part 'category_playlist_state.dart';

class CategoryPlaylistBloc extends Bloc<CategoryPlaylistEvent, CategoryPlaylistState> {
  CategoryPlaylistBloc() : super(CategoryPlaylistInitial()) {
    on<CategoryPlaylistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
