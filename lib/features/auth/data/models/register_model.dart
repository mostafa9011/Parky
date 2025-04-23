import 'package:flutter/material.dart';

class RegisterModel {
  // singleton
  static final RegisterModel _singleton = RegisterModel._internal();

  factory RegisterModel() => _singleton;

  RegisterModel._internal();

  // feilds
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalId = TextEditingController(text: '1234567890');
  String gender = 'Male';

  Map<String, dynamic> toJson() => {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'license_plate': licensePlateController.text,
        'car_model': carModelController.text,
        'phone_number': phoneController.text,
        'gender': gender,
        'national_id': nationalId.text,
        'username': firstNameController.text
      };

  // clear
  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    licensePlateController.clear();
    carModelController.clear();
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    licensePlateController.dispose();
    carModelController.dispose();
  }
}
