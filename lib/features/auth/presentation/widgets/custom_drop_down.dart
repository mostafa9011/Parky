import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

const List<String> _gender = [
  'Male',
  'Female',
];

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: 'Select Gender',
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(color: Colors.black54),
      ),
      items: _gender,
      // initialItem: _gender[0],
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}
