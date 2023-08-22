import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/cart/controllers/cart_controller.dart';

import 'package:shop_app/widgets/custom_drop_down.dart';
import 'package:shop_app/widgets/custom_outlined_button.dart';
import 'package:shop_app/widgets/custom_outlined_text_field.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class CartFilter extends GetView<CartController> {
  const CartFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Filter", style: Theme.of(context).textTheme.titleMedium),
            CustomOutlinedButton(
                text: "Reset",
                onPressed: () {
                  controller.reset();
                  Navigator.pop(context);
                })
          ],
        ),
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
        const SizedBox(height: 20),
        CustomPrimaryButton(
            onPressed: () {
              controller.getCarts();
              Navigator.pop(context);
            },
            text: "Apply Filter")
      ],
    );
  }
}
