import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/routes/app_route.dart';

class SplashController extends GetxController {
  bool isLoggedIn = false;

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  Future initialFunction() async {
    await checkLoginState();
    goToNextScreen();
  }

  Future checkLoginState() async {
    GetStorage box = GetStorage();
    isLoggedIn = box.read('isLoggedIn') != null;
  }

  Future goToNextScreen() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (isLoggedIn) {
        Get.toNamed(AppRoute.main);
      } else {
        Get.toNamed(AppRoute.login);
      }
    });
  }
}
