import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/product/controllers/product_categories_controller.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';
import 'package:shop_app/widgets/custom_drop_down.dart';
import 'package:shop_app/widgets/custom_outlined_button.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class ProductFilter extends GetView<ProductController> {
  const ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductCategoriesController>(
        init: Get.find<ProductCategoriesController>(),
        builder: (categoryController) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter",
                      style: Theme.of(context).textTheme.titleMedium),
                  CustomOutlinedButton(
                      text: "Reset",
                      onPressed: () {
                        categoryController.changeCategory("all");
                        controller.reset();
                        Navigator.pop(context);
                      })
                ],
              ),
              const SizedBox(height: 20),
              CustomDropDown(
                  label: "Category",
                  value: categoryController.category.value,
                  list: categoryController.listCategories,
                  onChanged: (value) {
                    categoryController.changeCategory(value.toString());
                  }),
              if (categoryController.category.value == "all")
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropDown(
                              label: "Sorting",
                              value: controller.sortLabel.value,
                              list: const ["Ascending", "Descending"],
                              onChanged: (value) {
                                controller.changeSort(value);
                              }),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CustomOutlinedTextField(
                              labelText: "Limit",
                              controller: controller.limit,
                              keyboardType: TextInputType.number,
                              hintText: "Limit"),
                        )
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                  onPressed: () {
                    if (categoryController.category.value == "all") {
                      controller.getProducts();
                    } else {
                      controller.getProductsByCategory(
                          categoryController.category.value);
                    }
                    Navigator.pop(context);
                  },
                  text: "Apply Filter")
            ],
          );
        });
  }
}
