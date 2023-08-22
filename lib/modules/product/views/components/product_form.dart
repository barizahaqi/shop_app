import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/product/controllers/product_categories_controller.dart';
import 'package:shop_app/modules/product/controllers/product_change_controller.dart';
import 'package:shop_app/widgets/custom_drop_down.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';

class ProductForm extends GetView<ProductChangeController> {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomOutlinedTextField(
            controller: controller.title,
            labelText: "Title",
            hintText: "Title",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.price,
            labelText: "Price",
            hintText: "Price",
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
            controller: controller.image,
            labelText: "Image Address",
            hintText: "Image Address",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedTextField(
            controller: controller.description,
            labelText: "Description",
            hintText: "Description",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstant.validationEmpty;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Obx(() => CustomDropDown(
              label: "Category",
              value: controller.category.value,
              list: Get.find<ProductCategoriesController>().listCategoriesForm,
              onChanged: (value) {
                controller.changeCategory(value.toString());
              })),
        ],
      ),
    );
  }
}
