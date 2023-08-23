import 'package:get/get.dart';
import 'package:shop_app/modules/settings/controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // controller
    Get.put<SettingsController>(SettingsController(), permanent: true);
  }
}
