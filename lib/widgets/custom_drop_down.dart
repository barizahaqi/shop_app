import 'package:flutter/material.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class CustomDropDown extends StatefulWidget {
  final String value;
  final String label;
  final List<String> list;
  final Function(dynamic)? onChanged;

  const CustomDropDown({
    super.key,
    required this.value,
    required this.label,
    required this.list,
    required this.onChanged,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          dropdownColor: Colors.white,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppStyles.primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          isExpanded: true,
          value: widget.value,
          onChanged: widget.onChanged,
          items: widget.list.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
