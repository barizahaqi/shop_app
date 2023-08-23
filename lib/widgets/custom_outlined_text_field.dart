import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final Icon? prefixIcon;
  final bool isDecimal;
  final bool onlyNumber;
  final String? Function(String? value)? validator;
  final bool readOnly;
  final bool enabled;
  final TextInputType keyboardType;
  final Function()? onTap;
  final Function(String value)? onChanged;

  const CustomOutlinedTextField({
    required this.controller,
    this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.isDecimal = false,
    this.onlyNumber = false,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          inputFormatters: [
            if (keyboardType == TextInputType.number && onlyNumber)
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            if (keyboardType == TextInputType.number && isDecimal)
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
            if (keyboardType == TextInputType.number)
              FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
          ],
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
