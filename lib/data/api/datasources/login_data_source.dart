import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/core/exceptions/server_exception.dart';
import 'package:shop_app/data/api/api_client.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/login/login_request.dart';
import 'package:shop_app/data/models/login/login_response.dart';

class LoginDataSource extends ApiClient {
  LoginDataSource({required String appBaseUrl}) : super(appBaseUrl: appBaseUrl);

  Future<Either<ErrorResponse, LoginResponse>> login(
      LoginRequest request) async {
    try {
      var url = StringConstant.loginUrl;
      Response response = await postMethod(url, request.toJson());
      return Right(LoginResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }
}
