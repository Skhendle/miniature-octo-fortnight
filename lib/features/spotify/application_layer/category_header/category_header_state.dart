part of 'category_header_bloc.dart';

abstract class CategoryHeaderState extends Equatable {
  const CategoryHeaderState();

  @override
  List<Object> get props => [];
}

class CategoryHeaderInitial extends CategoryHeaderState {}

class CategoryHeaderView extends CategoryHeaderState {
  final CategoryHeader data;
  const CategoryHeaderView({required this.data}) : super();
}

class CategoryHeaderError extends CategoryHeaderState {
  final String messgae;
  const CategoryHeaderError({required this.messgae}) : super();

}
