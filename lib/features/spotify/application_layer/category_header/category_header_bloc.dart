import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_header_event.dart';
part 'category_header_state.dart';

class CategoryHeaderBloc extends Bloc<CategoryHeaderEvent, CategoryHeaderState> {
  CategoryHeaderBloc() : super(CategoryHeaderInitial()) {
    on<CategoryHeaderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
