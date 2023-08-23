import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/cart_data_source.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';
import 'package:shop_app/modules/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  dependencies() {
    // datasources
    Get.put<CartDataSource>(CartDataSource(appBaseUrl: StringConstant.baseUrl),
        permanent: true);

    // repository
    Get.put<CartRepository>(CartRepository(cartDataSource: Get.find()),
        permanent: true);

    // controller
    Get.put<CartController>(CartController(cartRepository: Get.find()),
        permanent: true);
  }
}
