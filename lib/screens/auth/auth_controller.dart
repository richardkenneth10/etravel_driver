import 'package:country_picker/country_picker.dart';
import 'package:etravel_driver/helpers/functions.dart' as functions;
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _countryCode = '234'.obs;
  String get countryCode => '+${_countryCode()}';

  void openCountries(context) {
    functions.openCountries(
      context,
      (Country country) {
        _countryCode(country.phoneCode);
      },
    );
  }

  Future<void> goToRegistrationFlow() async {
    Get.toNamed('');
  }

  Future<void> login() async {
    Get.toNamed('');
  }
}
