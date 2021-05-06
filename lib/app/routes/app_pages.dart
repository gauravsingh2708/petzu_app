import 'package:flutter_blueprint/app/modules/home/binding/home_binding.dart';
import 'package:flutter_blueprint/app/modules/home/view/home_view.dart';
import 'package:flutter_blueprint/app/modules/login/Binding/login_binding.dart';
import 'package:flutter_blueprint/app/modules/login/view/login_view.dart';
import 'package:flutter_blueprint/app/modules/login/view/page/otp_view.dart';
import 'package:flutter_blueprint/app/modules/product/binding/product_binding.dart';
import 'package:flutter_blueprint/app/modules/product/view/product_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class AppPages{
  static const initial = _Paths.login;
  static var transitionDuration = const Duration(
    milliseconds: 300,
  );

  static final pages = <GetPage>[
    GetPage(
      name: _Paths.product,
      transitionDuration: transitionDuration,
      page: () => ProductView(),
      binding: ProductBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.login,
      transitionDuration: transitionDuration,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.otpScreen,
      transitionDuration: transitionDuration,
      page: () => OtpView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
  ];

}