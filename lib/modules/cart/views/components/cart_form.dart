import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/core/styles/app_styles.dart';

import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';

class CartForm extends GetView<CartChangeController> {
  const CartForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("List Product",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 15),
              for (int i = 0; i < controller.listCartId.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CustomOutlinedTextField(
                          controller: controller.listCartId[i],
                          hintText: "Product Id",
                          keyboardType: TextInputType.number,
                          onlyNumber: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringConstant.validationEmpty;
                            }
                            return null;
                          },
                        )),
                        const SizedBox(width: 15),
                        Expanded(
                            child: CustomOutlinedTextField(
                          controller: controller.listCartQuantity[i],
                          hintText: "Quantity",
                          keyboardType: TextInputType.number,
                          onlyNumber: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringConstant.validationEmpty;
                            }
                            return null;
                          },
                        )),
                        ElevatedButton(
                            onPressed: () {
                              if (controller.listCartId.length > 1) {
                                controller.listCartId.removeAt(i);
                                controller.listCartQuantity.removeAt(i);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(
                                  side: BorderSide(color: Colors.red)),
                            ),
                            child: const Icon(Icons.close, color: Colors.red)),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.listCartId.add(TextEditingController());
                    controller.listCartQuantity.add(TextEditingController());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(
                        side: BorderSide(color: AppStyles.primaryColor)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppStyles.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
