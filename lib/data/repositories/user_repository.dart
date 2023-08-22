import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/api/datasources/user_data_source.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/user/request/user_change_request.dart';
import 'package:shop_app/data/models/user/request/user_request.dart';
import 'package:shop_app/data/models/user/response/user_change_response.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/data/models/user/user_component.dart';

class UserRepository extends GetxService {
  UserRepository({required this.userDataSource});

  final UserDataSource userDataSource;

  Future<Either<ErrorResponse, List<UserResponse>>> getUsers(
      String limit, String sort) async {
    return userDataSource.getUser(UserRequest(limit: limit, sort: sort));
  }

  Future<Either<ErrorResponse, UserResponse>> getUserById(String id) async {
    return userDataSource.getUserById(IdModel(id: id));
  }

  Future<Either<ErrorResponse, IdModel>> addUser(
      String email,
      String username,
      String password,
      String firstname,
      String lastname,
      String phone,
      String lat,
      String long,
      String city,
      String street,
      String number,
      String zipcode) async {
    UserChangeRequest request = UserChangeRequest(
      email: email,
      username: username,
      pasword: password,
      name: UserName(firstname: firstname, lastname: lastname),
      phone: phone,
      address: UserAddress(
          geolocation: UserLocation(lat: lat, long: long),
          city: city,
          street: street,
          number: int.parse(number),
          zipcode: zipcode),
    );
    return userDataSource.addUser(request);
  }

  Future<Either<ErrorResponse, UserChangeResponse>> updateUser(
      String id,
      String email,
      String username,
      String password,
      String firstname,
      String lastname,
      String phone,
      String lat,
      String long,
      String city,
      String street,
      String number,
      String zipcode) async {
    UserChangeRequest request = UserChangeRequest(
      id: id,
      email: email,
      username: username,
      pasword: password,
      name: UserName(firstname: firstname, lastname: lastname),
      phone: phone,
      address: UserAddress(
          geolocation: UserLocation(lat: lat, long: long),
          city: city,
          street: street,
          number: int.parse(number),
          zipcode: zipcode),
    );
    return userDataSource.updateUser(request);
  }

  Future<Either<ErrorResponse, UserResponse>> deleteUser(String id) async {
    IdModel request = IdModel(id: id);
    return userDataSource.deleteUser(request);
  }
}
