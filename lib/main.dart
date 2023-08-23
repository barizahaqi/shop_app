import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/modules/splash/bindings/splash_binding.dart';
import 'package:shop_app/modules/user/bindings/user_binding.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/core/styles/app_styles.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstant.appName,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppStyles.primaryColor,
              onPrimary: Colors.white,
              secondary: AppStyles.secondaryColor,
            ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: AppStyles.myTextTheme,
        useMaterial3: true,
      ),
      getPages: AppRoute.routes,
      initialRoute: AppRoute.splash,
      initialBinding: BindingsBuilder(() {
        SplashBinding().dependencies();
        UserBinding().dependencies();
      }),
    );
  }
}
