import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/exceptions/server_exception.dart';
import 'package:shop_app/data/api/api_client.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/user/request/user_change_request.dart';
import 'package:shop_app/data/models/user/request/user_request.dart';
import 'package:shop_app/data/models/user/response/user_change_response.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';

import 'package:shop_app/core/constants/string_constant.dart';

class UserDataSource extends ApiClient {
  UserDataSource({required String appBaseUrl}) : super(appBaseUrl: appBaseUrl);

  Future<Either<ErrorResponse, List<UserResponse>>> getUser(
      UserRequest request) async {
    try {
      final requestParams = {};

      if (request.limit.isNotEmpty) {
        requestParams['limit'] = request.limit;
      }

      if (request.sort.isNotEmpty) {
        requestParams['sort'] = request.sort;
      }

      var url = "${StringConstant.usersUrl}?";
      url = url +
          requestParams.entries.map((e) => '${e.key}=${e.value}').join('&');

      Response response = await getMethod(url);
      return Right((response.body as List)
          .map((e) => UserResponse.fromJson(e))
          .toList());
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, UserResponse>> getUserById(
      IdModel request) async {
    try {
      var url = "${StringConstant.usersUrl}/${request.id}";
      Response response = await getMethod(url);
      return Right(UserResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, IdModel>> addUser(
      UserChangeRequest request) async {
    try {
      var url = StringConstant.usersUrl;
      Response response = await postMethod(url, request.toJson());
      return Right(IdModel.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, UserChangeResponse>> updateUser(
      UserChangeRequest request) async {
    try {
      var url = "${StringConstant.usersUrl}/${request.id}";
      Response response = await putMethod(url, request.toJson());
      return Right(UserChangeResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, UserResponse>> deleteUser(
      IdModel request) async {
    try {
      var url = "${StringConstant.usersUrl}/${request.id}";
      Response response = await deleteMethod(url);
      return Right(UserResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }
}
