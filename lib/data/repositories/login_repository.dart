import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/api/datasources/login_data_source.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/login/login_request.dart';
import 'package:shop_app/data/models/login/login_response.dart';

class LoginRepository extends GetxService {
  LoginRepository({required this.loginDataSource});

  final LoginDataSource loginDataSource;

  Future<Either<ErrorResponse, LoginResponse>> login(
      String username, String password) async {
    LoginRequest request = LoginRequest(username: username, password: password);
    return loginDataSource.login(request);
  }
}
