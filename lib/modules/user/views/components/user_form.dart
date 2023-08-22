import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';

class UserForm extends GetView<UserChangeController> {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomOutlinedTextField(
                controller: controller.firstname,
                labelText: "First Name",
                hintText: "First Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConstant.validationEmpty;
                  }
                  return null;
                },
              )),
              const SizedBox(width: 15),
              Expanded(
                child: CustomOutlinedTextField(
                  controller: controller.lastname,
                  labelText: "Last Name",
                  hintText: "Last Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringConstant.validationEmpty;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.email,
            labelText: "Email",
            hintText: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.username,
            labelText: "Username",
            hintText: "Username",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.password,
            labelText: "Password",
            hintText: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.phone,
            labelText: "Phone",
            hintText: "Phone",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.city,
            labelText: "City",
            hintText: "City",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.street,
            labelText: "Street",
            hintText: "Street",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.number,
            labelText: "Street Number",
            hintText: "Street Numberr",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.zipcode,
            labelText: "Zipcode",
            hintText: "Zipcode",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.lat,
            labelText: "Latitude",
            hintText: "Latitude",
            keyboardType: TextInputType.number,
            isDecimal: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.long,
            labelText: "Longitude",
            hintText: "Longitude",
            keyboardType: TextInputType.number,
            isDecimal: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
