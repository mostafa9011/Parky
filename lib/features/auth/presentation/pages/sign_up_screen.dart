import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/text_style.dart';
import 'package:parky/features/auth/data/models/register_form.dart';
import 'package:parky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:parky/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:parky/features/auth/presentation/widgets/custom_drop_down.dart';

import '../../../../config/routes/page_name.dart';
import '../../../../config/themes/assets_manager.dart';
import '../../../../config/themes/color_manager.dart';
import '../../../../core/utils/widgets/circular_image.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../widgets/image_sourse_dialog.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterForm registerForm = AuthCubit.get(context).registerForm;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.onBoardingBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: customAppBar(
            title: 'Sign Up',
            onBack: () {
              Navigator.pop(context);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircularImage(
                          radius: 55.r,
                          // fileImage: doctorAccount.image,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 90.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: ColorManager.primaryColor,
                            ),
                            onPressed: () {
                              showImageSourceDialog(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  //First name
                  Text(
                    "First name",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  CustomTextFormField(
                    controller: registerForm.firstNameController,
                    textHint: "First name",
                    colorBorder: Colors.black54,
                  ),
                  //Last name
                  Text(
                    "Last name",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  CustomTextFormField(
                    controller: registerForm.lastNameController,
                    textHint: "Last name",
                    colorBorder: Colors.black54,
                  ),
                  //email
                  Text(
                    "Email",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  CustomTextFormField(
                    controller: registerForm.emailController,
                    textHint: "Email",
                    colorBorder: Colors.black54,
                  ),
                  //password
                  Text(
                    "Password",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  CustomTextFormField(
                    controller: registerForm.passwordController,
                    textHint: "Password",
                    colorBorder: Colors.black54,
                  ),
                  //phone
                  Text(
                    "Phone",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const CustomTextFormField(
                    textHint: "Phone",
                    colorBorder: Colors.black54,
                    keyboardType: TextInputType.phone,
                  ),
                  // notional id
                  Text(
                    "National ID",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const CustomTextFormField(
                    textHint: "National ID",
                    colorBorder: Colors.black54,
                    keyboardType: TextInputType.phone,
                  ),
                  //gender drop down
                  Text(
                    "Gender",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const CustomDropDown(),
              
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PageName.completeSignUpScreen,
                      );
                    },
                    text: "Complete Sign Up",
                    isLoading: false,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
