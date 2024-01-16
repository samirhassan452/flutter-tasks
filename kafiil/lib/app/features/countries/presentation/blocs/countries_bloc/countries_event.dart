part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CountriesOnFetch extends CountriesEvent {}

class CountriesOnFetchMore extends CountriesEvent {}

class CountriesOnGo extends CountriesEvent {
  final int index;
  CountriesOnGo({required this.index});

  @override
  List<Object?> get props => [index];
}

class CountriesOnNext extends CountriesEvent {}

class CountriesOnLast extends CountriesEvent {}

class CountriesOnPrev extends CountriesEvent {}

class CountriesOnFirst extends CountriesEvent {}
