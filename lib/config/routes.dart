import 'package:etravel_driver/screens/auth/auth.dart';
import 'package:etravel_driver/screens/initial/initial.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> allRoutes = [
    initial,
    auth,
  ];

  static String initialRoute = '/';

  static get authScreen => auth.name;

  static get initialScreen => initial.name;
}
