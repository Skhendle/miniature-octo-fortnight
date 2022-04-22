part of 'category_header_bloc.dart';

abstract class CategoryHeaderEvent extends Equatable {
  const CategoryHeaderEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryHeaderEvent extends CategoryHeaderEvent {
  final String categoryId;

  const GetCategoryHeaderEvent({required this.categoryId});
}
