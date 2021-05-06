import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/data/service/common_service.dart';
import 'package:flutter_blueprint/app/routes/app_pages.dart';
import 'package:flutter_blueprint/app/theme/styles.dart';
import 'package:flutter_blueprint/app/utils/utility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Main entry of the application sb
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    runApp(MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}
/// Initialize the services before the app starts.
Future<void> initServices() async {
  await Firebase.initializeApp();
  Get.put(CommonService(), permanent: true,);
}

/// A class to create the initial structure of the
/// application and adds routes in the application
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 745),
    builder:()=> GetMaterialApp(
          title: 'Petzu',
          theme: Styles.lightTheme,
          darkTheme: Styles.darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        ),
  );
}
