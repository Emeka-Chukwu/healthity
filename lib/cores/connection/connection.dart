import 'package:data_connection_checker/data_connection_checker.dart';

checkDataConnection() async {
  bool result = await DataConnectionChecker().hasConnection;
  return result;
}
