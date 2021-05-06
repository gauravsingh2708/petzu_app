import 'package:flutter_blueprint/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RoutesManagement{

  /// Go to the home screen.
  static void goToHome() {
    Get.offAllNamed<void>(
        AppRoutes.home
    );
  }

  /// Go to the otp screen.
  static void goToOtpScreen() {
    Get.toNamed<void>(
        AppRoutes.otpScreen
    );
  }

  /// Go to the product screen.
  static void goToProduct() {
    Get.toNamed<void>(
        AppRoutes.otpScreen
    );
  }
}