import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/text_style.dart';
import 'package:parky/features/auth/presentation/widgets/custom_app_bar.dart';

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
                children: [
                  Stack(
                    children: [
                      CircularImage(
                        radius: 55.r,
                        // fileImage: doctorAccount.image,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: getRegularStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const CustomTextFormField(
                        textHint: "Name",
                        colorBorder: Colors.black54,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: getRegularStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const CustomTextFormField(
                        textHint: "Email",
                        colorBorder: Colors.black54,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: getRegularStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const CustomTextFormField(
                        textHint: "Password",
                        colorBorder: Colors.black54,
                      ),
                    ],
                  ),
                  SizedBox(height: .2.sh),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
