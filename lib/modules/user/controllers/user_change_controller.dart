import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/user_repository.dart';

class UserChangeController extends GetxController {
  final UserRepository userRepository;
  UserChangeController({required this.userRepository});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();

  void addUser() async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await userRepository.addUser(
          email.text,
          username.text,
          password.text,
          firstname.text,
          lastname.text,
          city.text,
          street.text,
          number.text,
          zipcode.text,
          lat.text,
          long.text,
          phone.text);
      response.fold(
          (failed) => Get.snackbar("Failed to add User", failed.message),
          (success) => Get.snackbar("Success", "User added"));
    }
  }

  void updateUser(String id) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await userRepository.updateUser(
          id,
          email.text,
          username.text,
          password.text,
          firstname.text,
          lastname.text,
          phone.text,
          lat.text,
          long.text,
          city.text,
          street.text,
          number.text,
          zipcode.text);
      response.fold(
          (failed) => Get.snackbar("Failed to update User", failed.message),
          (success) => Get.snackbar("Success", "User updated"));
    }
  }

  void deleteUser(String id) async {
    final response = await userRepository.deleteUser(id);
    response.fold(
        (failed) => Get.snackbar("Failed to delete User", failed.message),
        (success) => Get.snackbar("Success", "User deleted successfully"));
  }

  void initForm(
      String email,
      String username,
      String password,
      String firstname,
      String lastname,
      String city,
      String street,
      String number,
      String zipcode,
      String lat,
      String long,
      String phone) {
    this.email.text = email;
    this.username.text = username;
    this.password.text = password;
    this.firstname.text = firstname;
    this.lastname.text = lastname;
    this.city.text = city;
    this.street.text = street;
    this.number.text = number;
    this.zipcode.text = zipcode;
    this.phone.text = phone;
    this.lat.text = lat;
    this.long.text = long;
  }
}
