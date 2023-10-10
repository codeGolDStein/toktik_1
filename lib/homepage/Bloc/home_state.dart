part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingNewPageState extends HomeState {}

class HomeSuccessNewPageState extends HomeState {
  final InfoText infotext;
  HomeSuccessNewPageState(
      {required this.infotext});
}