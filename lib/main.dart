import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'features/authentication/blocs/authPage.dart';
import 'features/boarding/screen/boarding_one.dart';
import 'features/drugs/blocs/drugs_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<DrugBloc>(create: (context) => DrugBloc()),
    BlocProvider<AuthPageBloc>(create: (context) => AuthPageBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoardingOne();
  }
}
