import 'package:etravel_driver/services/auth_service.dart';
import 'package:etravel_driver/services/location_service.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final auth = AuthService();
    Get.put(AuthService(), permanent: true);
    // Get.put(ETravelDB(), permanent: true);
    Get.put(LocationService(), permanent: true);
    // Get.lazyPut(() => APIService(), fenix: true);
    // Get.lazyPut(() => PaymentService(), fenix: true);
    // Get.lazyPut(() => UserDataService(), fenix: true);
  }
}
