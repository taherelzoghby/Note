part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class Searching extends SearchState {}

class NotSearching extends SearchState {}

class FilteringSearch extends SearchState {
  final List<Note> filteringSearch;

  FilteringSearch({required this.filteringSearch});
}
