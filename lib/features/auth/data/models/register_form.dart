import 'package:flutter/material.dart';

class RegisterForm {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController carModelController = TextEditingController();

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
