import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthify/cores/change_screen.dart';
import 'package:healthify/features/authentication/models/users.dart';
import 'package:healthify/features/authentication/repositories/repository.dart';
import 'package:healthify/features/pharmacies/screens/home_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// event section
abstract class AuthUser extends Equatable {
  const AuthUser();

  @override
  List<Object> get props => [];
}

class RegisterUser extends AuthUser {
  String username;
  String email;
  String password;
  String confirm_password;
  RegisterUser({
    this.username,
    this.email,
    this.password,
    this.confirm_password,
  });
}

class RegisterStore extends AuthUser {
  String storename;
  String email;
  String address;
  String password;
  String confirm_password;
  RegisterStore({
    this.storename,
    this.email,
    this.address,
    this.password,
    this.confirm_password,
  });
}

class LoginUser extends AuthUser {
  String email;
  String password;
  LoginUser({
    this.email,
    this.password,
  });
}

class LoginStore extends AuthUser {
  String email;
  String password;
  LoginStore({
    this.email,
    this.password,
  });
}

class PasswordReset extends AuthUser {
  String email;
  bool isUser;
  PasswordReset({
    this.email,
    this.isUser = true,
  });
}

class LogoutUser extends AuthUser {
  const LogoutUser();
}

// the state declaration

abstract class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object> get props => [];
}

class AuthUserInitial extends AuthUserState {}

class AuthUserAuthenticating extends AuthUserState {
  AuthUserAuthenticating();
}

class AuthUserAuthenticated extends AuthUserState {
  final Users user;
  AuthUserAuthenticated({@required this.user});
}

class AuthUserNotAuthenticated extends AuthUserState {
  AuthUserNotAuthenticated();
}

class AuthStoreRegister extends AuthUserState {
  AuthStoreRegister();
}

class AuthUserRegister extends AuthUserState {
  AuthUserRegister();
}

class AuthUserEmail extends AuthUserState {
  AuthUserEmail();
}
// class AuthUserRegister extends AuthUserState {
//   AuthUserRegister();
// }

class AuthUserError extends AuthUserState {
  final String message;
  const AuthUserError({@required this.message});
}

// the hydrated Drugbloc section
class AuthUserBloc extends HydratedBloc<AuthUser, AuthUserState> {
  UserRepository userRepository = UserRepository();
  AuthUserBloc() : super(AuthUserInitial());
  String loggedIn = "loggedIn";

  @override
  Stream<AuthUserState> mapEventToState(
    AuthUser event,
  ) async* {
    if (event is RegisterUser) {
      yield* _registerUser(event);
    } else if (event is LoginUser) {
      yield* _loginUser(event);
    } else if (event is LogoutUser) {
      yield* _logOutUser();
    } else if (event is RegisterStore) {
      yield* _registerStore(event);
    } else if (event is LoginStore) {
      yield* _loginStore(event);
    } else if (event is PasswordReset) {
      yield* _requestPasswordChange(event);
    }
  }

  @override
  AuthUserState fromJson(Map<String, dynamic> json) =>
      AuthUserAuthenticated(user: Users.fromJson(json["user"]));

  @override
  Map<String, dynamic> toJson(AuthUserState state) {
    if (state is AuthUserAuthenticated) {
      return {"user": state.user};
    }
    return null;
  }

  Stream<AuthUserState> _registerUser(RegisterUser register) async* {
    print(register.confirm_password);
    print(2);
    print(register.username);
    print(register.email);
    print(register.password);
    print(register.confirm_password);

    if (register.username.isNotEmpty &&
        register.email.isNotEmpty &&
        register.password.isNotEmpty) {
      yield AuthUserAuthenticating();

      if (register.password == register.confirm_password) {
        var user = await userRepository.register(
          register.email,
          register.password,
          register.username,
          register.confirm_password,
        );
        print(user);
        yield AuthUserRegister();
      }
    }

    // print(user);
    // final int pageView = fetch.signIn;
  }

  Stream<AuthUserState> _registerStore(RegisterStore register) async* {
    // yield AuthUserInitial();

    print(register.confirm_password);
    print(2);
    print(register.email);
    print(register.password);
    print(register.confirm_password);

    if (register.storename.isNotEmpty &&
        register.email.isNotEmpty &&
        register.password.isNotEmpty) {
      if (register.password == register.confirm_password) {
        yield AuthUserAuthenticating();

        var user = await userRepository.registerStore(
            register.email,
            register.password,
            register.storename,
            register.confirm_password,
            register.address);

        yield AuthStoreRegister();
        print(user);
      }
    }

    // print(user);
    // final int pageView = fetch.signIn;
  }

  Stream<AuthUserState> _loginUser(LoginUser loginUser) async* {
    yield AuthUserInitial();
    print(loginUser.email);
    print(loginUser.password);

    if (loginUser.email.isNotEmpty && loginUser.password.isNotEmpty) {
      yield AuthUserAuthenticating();
      try {
        // Create storage
        final storage = new FlutterSecureStorage();
        final user =
            await userRepository.loginIn(loginUser.email, loginUser.password);
        print(user["error"]);

        // if(user["message"])

        await storage.write(
          key: loggedIn,
          value: user["token"],
        );
        print(user);
        // print(await storage.read(key: loggedIn));
        if (user["success"] != null) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(user["token"]);
          print(decodedToken);
          yield AuthUserAuthenticated(user: Users.fromJson(decodedToken));
        } else {
          throw (user["error"]);
        }
      } catch (e) {
        print("Catch");
        print(e);
        yield AuthUserError(message: e);
      }
    }

    // print(user);
    // final int pageView = fetch.signIn;
  }

  Stream<AuthUserState> _loginStore(LoginStore loginUser) async* {
    yield AuthUserInitial();
    print(loginUser.email);
    print(loginUser.password);

    if (loginUser.email.isNotEmpty && loginUser.password.isNotEmpty) {
      yield AuthUserAuthenticating();
      try {
        // Create storage
        final storage = new FlutterSecureStorage();
        final user = await userRepository.loginStoreIn(
            loginUser.email, loginUser.password);
        print(user["error"]);

        // if(user["message"])

        await storage.write(
          key: loggedIn,
          value: user["token"],
        );
        print(user);
        // print(await storage.read(key: loggedIn));
        if (user["success"] != null) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(user["token"]);
          print(decodedToken);
          yield AuthUserAuthenticated(user: Users.fromJson(decodedToken));
        } else {
          throw (user["error"]);
        }
      } catch (e) {
        print("Catch");
        print(e);
        yield AuthUserError(message: e);
      }
    }

    // print(user);
    // final int pageView = fetch.signIn;
  }

  Stream<AuthUserState> _logOutUser() async* {
    bool logged_out = await userRepository.logoutUserStore();
    print("logout out");
    if (logged_out) {
      yield AuthUserNotAuthenticated();
      print("logout in");
    }
  }

  Stream<AuthUserState> _requestPasswordChange(PasswordReset reset) async* {
    try {
      final email = await userRepository.receiveEmailForResetPassword(
          reset.email, reset.isUser);
      print(email);
      print(email["success"]);
      if (email["success"] != null) {
        yield AuthUserEmail();
      }
    } catch (e) {
      print(e);
    }
  }
}
