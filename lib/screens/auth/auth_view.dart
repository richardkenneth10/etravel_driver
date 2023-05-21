import 'package:etravel_driver/config/app_colors.dart';
import 'package:etravel_driver/screens/auth/auth_controller.dart';
import 'package:etravel_driver/widgets/etravel_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  static String name = '/auth';

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<AuthController>();

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                children: [
                  const Text(
                    'Enter your number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),

                  ETravelElevatedButton(
                    text: 'Log in',
                    onPressed: _.login,
                  ),
                  const SizedBox(height: 20),
                  //or divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.grey.withOpacity(0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text.rich(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                const TextSpan(
                  children: [
                    TextSpan(text: 'If you are creating a new account, '),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' will apply'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
