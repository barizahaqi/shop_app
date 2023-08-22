import 'package:get/get.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

class CartUserController extends GetxController with StateMixin<CartResponse> {
  final CartRepository cartRepository;
  CartUserController({required this.cartRepository});

  Future<void> getUserCart(String userId) async {
    change(null, status: RxStatus.loading());
    final response = await cartRepository.getCartByUserId(userId);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {change(success, status: RxStatus.success())});
  }
}
