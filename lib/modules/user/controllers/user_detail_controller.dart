import 'package:get/get.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/data/repositories/user_repository.dart';

class UserDetailController extends GetxController
    with StateMixin<UserResponse> {
  final UserRepository userRepository;
  UserDetailController({required this.userRepository});

  Future<void> getDetailUser(String id) async {
    change(null, status: RxStatus.loading());
    final response = await userRepository.getUserById(id);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {change(success, status: RxStatus.success())});
  }
}
