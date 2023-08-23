import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/routes/app_route.dart';

class SettingsController extends GetxController {
  RxString token = StringConstant.emptyString.obs;

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  void getToken() {
    token.value = GetStorage().read("token");
  }

  void signOut() {
    GetStorage().remove("token");
    GetStorage().remove("isLoggedIn");
    Get.offAllNamed(AppRoute.login);
  }
}
