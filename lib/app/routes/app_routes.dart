part of 'app_pages.dart';


/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class AppRoutes{
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const otpScreen = _Paths.otpScreen;
  static const product = _Paths.product;
}

abstract class _Paths{
  static const home = '/home';
  static const login = '/login';
  static const otpScreen = '/otp_screen';
  static const product = '/product';

}