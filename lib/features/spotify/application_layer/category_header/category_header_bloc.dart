import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/data_layer/catergory_header_api.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/domain_layer/catergory_header_model.dart';

part 'category_header_event.dart';
part 'category_header_state.dart';

class CategoryHeaderBloc
    extends Bloc<CategoryHeaderEvent, CategoryHeaderState> {
  CategoryHeaderBloc() : super(CategoryHeaderInitial()) {
    on<GetCategoryHeaderEvent>(_oneGetCategoriesHeader);
  }
  final CatergoryHeaderAPI repo = CatergoryHeaderAPI();

  Future<void> _oneGetCategoriesHeader(
      GetCategoryHeaderEvent event, Emitter<CategoryHeaderState> emit) async {
    try {
      var data = await repo.getPlaylistHeader("afro");
      emit(CategoryHeaderView(data: data));
    } catch (e) {
      emit(CategoryHeaderError(messgae: e.toString()));
    }
  }
}
