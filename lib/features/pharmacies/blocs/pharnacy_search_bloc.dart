import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:healthify/features/pharmacies/models/search_pharmacy.dart';
import 'package:healthify/features/pharmacies/repositories/pharmacy_repositiory.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// event section
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearch extends SearchEvent {
  final String searchText;
  FetchSearch({@required this.searchText});
}

// the state declaration

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  InventorySearch inventorySearch;
  SearchLoaded({@required this.inventorySearch});
}

class SearchError extends SearchState {
  final String message;
  const SearchError({@required this.message});
}

// the hydrated Drugbloc section
class PharmacyBloc extends HydratedBloc<SearchEvent, SearchState> {
  PharmacyBloc() : super(SearchInitial());

  PharmacyRepository pharmacyRepository = PharmacyRepository();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchSearch) {
      yield* _getPharmaciesDataSearch(event);
    }
  }

  @override
  SearchState fromJson(Map<String, dynamic> json) =>
      SearchLoaded(inventorySearch: InventorySearch.fromJson(json["search"]));

  @override
  Map<String, dynamic> toJson(SearchState state) {
    if (state is SearchLoaded) {
      return {"search": state.inventorySearch};
    }
    return null;
  }

  Stream<SearchState> _getPharmaciesDataSearch(FetchSearch searchText) async* {
    yield SearchInitial();
    try {
      final search =
          await pharmacyRepository.getAllSearchDrugs(searchText.searchText);
      var sorted;
      if (search != null) {
        sorted =
            pharmacyRepository.getDrugsSearched(search, searchText.searchText);
      }
      yield SearchLoaded(inventorySearch: sorted);
    } catch (e) {
      print(e.toString());
      yield SearchError(message: e.toString());
    }
  }
}
