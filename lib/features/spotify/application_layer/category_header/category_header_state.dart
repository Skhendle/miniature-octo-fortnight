part of 'category_header_bloc.dart';

abstract class CategoryHeaderState extends Equatable {
  const CategoryHeaderState();

  @override
  List<Object> get props => [];
}

class CategoryHeaderInitial extends CategoryHeaderState {}

class CategoryHeaderView extends CategoryHeaderState {}

class CategoryHeaderError extends CategoryHeaderState {}
