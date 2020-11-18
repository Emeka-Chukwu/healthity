import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// event section
abstract class AuthPageEvent extends Equatable {
  const AuthPageEvent();

  @override
  List<Object> get props => [];
}

class FetchAuthPage extends AuthPageEvent {
  final int signIn;
  FetchAuthPage({@required this.signIn});
}

// the state declaration

abstract class AuthPageState extends Equatable {
  const AuthPageState();

  @override
  List<Object> get props => [];
}

class AuthPageInitial extends AuthPageState {}

class AuthPageLoaded extends AuthPageState {
  final int signin;
  AuthPageLoaded({@required this.signin});
}

class AuthPageError extends AuthPageState {
  const AuthPageError();
}

// the hydrated Drugbloc section
class AuthPageBloc extends HydratedBloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc() : super(AuthPageLoaded(signin: 1));

  @override
  Stream<AuthPageState> mapEventToState(
    AuthPageEvent event,
  ) async* {
    if (event is FetchAuthPage) {
      yield* _displayAuthPage(event);
    }
  }

  @override
  AuthPageState fromJson(Map<String, dynamic> json) =>
      AuthPageLoaded(signin: json["signInInt"] ?? 1);

  @override
  Map<String, dynamic> toJson(AuthPageState state) {
    if (state is AuthPageLoaded) {
      print("checking");
      return {"signInInt": state.signin};
    }
    return null;
  }

  Stream<AuthPageState> _displayAuthPage(FetchAuthPage fetch) async* {
    yield AuthPageInitial();
    final int pageView = fetch.signIn;
    yield AuthPageLoaded(signin: pageView);
  }
}
