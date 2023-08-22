import 'package:get/get.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

class CartDetailController extends GetxController
    with StateMixin<CartResponse> {
  final CartRepository cartRepository;
  CartDetailController({required this.cartRepository});

  Future<void> getDetailCart(String id) async {
    change(null, status: RxStatus.loading());
    final response = await cartRepository.getCartById(id);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {change(success, status: RxStatus.success())});
  }
}
