import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// event section
abstract class DrugEvent extends Equatable {
  const DrugEvent();

  @override
  List<Object> get props => [];
}

class FetchDrugs extends DrugEvent {
  FetchDrugs();
}

// the state declaration

abstract class DrugState extends Equatable {
  const DrugState();

  @override
  List<Object> get props => [];
}

class DrugInitial extends DrugState {}

class DrugSearch extends DrugState {}

class DrugError extends DrugState {
  const DrugError();
}

// the hydrated Drugbloc section
class DrugBloc extends HydratedBloc<DrugEvent, DrugState> {
  DrugBloc() : super(DrugInitial());

  @override
  Stream<DrugState> mapEventToState(
    DrugEvent event,
  ) async* {
    if (event is FetchDrugs) {
      // print("emeka emeka");
      yield* _getDrugs(event);
    }
  }

  @override
  DrugState fromJson(Map<String, dynamic> json) {
    // try {
    //   print("retriving 1");
    //   // print(json);
    //   print("retriving 2");

    //   final btc = CrytoCurrencies.fromJson(json["btc"]);
    //   final eth = CrytoCurrencies.fromJson(json["eth"]);
    //   final eos = CrytoCurrencies.fromJson(json["eos"]);
    //   final steem = CrytoCurrencies.fromJson(json["steem"]);
    //   print(eth.data);

    //   final data = AllData(btc: btc, eth: eth, eos: eos, steem: steem);
    //   return BlocLoaded(btc: btc, eth: eth, eos: eos, steem: steem, data: data);
    // } catch (err) {
    //   print("err");
    //   print(err);
    //   return null;
    // }
  }

  @override
  Map<String, dynamic> toJson(DrugState state) {
    // if (state is BlocLoaded) {
    //   print("checking");
    //   // print(state);
    //   return state.data.toMap();
    // }
    // return null;
  }

  Stream<DrugState> _getDrugs(FetchDrugs fetch) async* {
    print("object");
    // yield BlocInitial();
    // try {
    //   // print("emek");
    //   final btc = await blocRepository.getAllCrypto("btc");
    //   final eth = await blocRepository.getAllCrypto("eth");
    //   final eos = await blocRepository.getAllCrypto("eos");
    //   final steem = await blocRepository.getAllCrypto("steem");
    //   final data = AllData(btc: btc, eth: eth, eos: eos, steem: steem);
    //   // print(btc.data);
    //   print("emeka emeka emeka");
    //   yield BlocLoaded(
    //       btc: btc,
    //       eth: eth,
    //       eos: eos,
    //       steem: steem,
    //       index: fetch.index,
    //       data: data);
    //   print(BlocLoaded());
    // } catch (err) {
    //   print(err);
    //   yield BlocError();
    // }
  }

  Stream<DrugState> _changeGraph() async* {
    print("changing graphs");
    yield DrugInitial();
    // try {
    //   // print("emek");
    //   final btc = graph.allData.btc;
    //   final eth = graph.allData.eth;
    //   final eos = graph.allData.eos;
    //   final steem = graph.allData.steem;
    //   final data = AllData(btc: btc, eth: eth, eos: eos, steem: steem);
    //   print(btc.data);
    //   print(graph.index);
    //   // print("emeka emeka emeka");
    //   yield BlocLoaded(
    //       btc: btc,
    //       eth: eth,
    //       eos: eos,
    //       steem: steem,
    //       index: graph.index,
    //       data: data);
    //   print(BlocLoaded());
    // } catch (err) {
    //   print(err);
    //   yield BlocError();
    // }
  }
}
