import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:healthify/features/pharmacies/models/search_pharmacy.dart';
import 'package:healthify/features/pharmacies/repositories/pharmacy_repositiory.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// event section
abstract class PharmacyEvent extends Equatable {
  const PharmacyEvent();

  @override
  List<Object> get props => [];
}

class FetchPharmacy extends PharmacyEvent {
  FetchPharmacy();
}

class FetchSearch extends PharmacyEvent {
  final String searchText;

  FetchSearch({@required this.searchText});
}

// the state declaration

abstract class PharmacyState extends Equatable {
  const PharmacyState();

  @override
  List<Object> get props => [];
}

class PharmacyInitial extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  Pharmacy pharmacy;
  PharmacyLoaded({@required this.pharmacy});
}

class SearchLoaded extends PharmacyState {
  List<InventorySearch> inventorySearch;
  SearchLoaded({@required this.inventorySearch});
}

class PharmacyError extends PharmacyState {
  final String message;
  const PharmacyError({@required this.message});
}

// the hydrated Drugbloc section
class PharmacyBloc extends HydratedBloc<PharmacyEvent, PharmacyState> {
  PharmacyBloc() : super(PharmacyInitial());

  PharmacyRepository pharmacyRepository = PharmacyRepository();

  @override
  Stream<PharmacyState> mapEventToState(
    PharmacyEvent event,
  ) async* {
    if (event is FetchPharmacy) {
      yield* _getPharmaciesData();
      // yield* _getPharmaciesDataSearch();

    } else if (event is FetchSearch) {
      yield* _getPharmaciesDataSearch(event);
    }
  }

  @override
  PharmacyState fromJson(Map<String, dynamic> json) =>
      PharmacyLoaded(pharmacy: Pharmacy.fromJson(json["pharmacy"]));

  @override
  Map<String, dynamic> toJson(PharmacyState state) {
    if (state is PharmacyLoaded) {
      print("checking");
      return {"pharmacy": state.pharmacy};
    }
    return null;
  }

  Stream<PharmacyState> _getPharmaciesData() async* {
    yield PharmacyInitial();
    // final int pageView = fetch.signIn;
    try {
      final pharmacy = await pharmacyRepository.getAllStoresData();
      yield PharmacyLoaded(pharmacy: pharmacy);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<PharmacyState> _getPharmaciesDataSearch(
      FetchSearch searchText) async* {
    print("sorted");
    print(searchText.searchText);
    yield PharmacyInitial();
    try {
      final search =
          await pharmacyRepository.getAllSearchDrugs(searchText.searchText);
      List<InventorySearch> sorted;
      if (search != null) {
        sorted =
            pharmacyRepository.getDrugsSearched(search, searchText.searchText);
        print(sorted[0]);
        yield SearchLoaded(inventorySearch: sorted);
      }
    } catch (e) {
      print(e.toString());
      yield PharmacyError(message: e.toString());
    }
  }
}
