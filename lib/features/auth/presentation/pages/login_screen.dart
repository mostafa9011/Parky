import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/routes/page_name.dart';
import 'package:parky/config/themes/color_manager.dart';
import 'package:parky/config/themes/text_style.dart';
import 'package:parky/core/utils/widgets/custom_elevated_button.dart';
import 'package:parky/core/utils/widgets/custom_text_form_field.dart';

import '../../../../config/themes/assets_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.onBoarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.5.sh),
                Text(
                  "Sign In",
                  style: getBoldStyle(
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hi ! Welcome back, you've been missed",
                  style: getBoldStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomTextFormField(
                  textHint: "Email",
                ),
                CustomTextFormField(
                  textHint: "password",
                  obscureText: obscureText,
                  isSuffixWidget: true,
                  passwordVisibility: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  onPressed: () {
                    // showScaffoldMessage(context);
                    Navigator.pushNamed(context, PageName.layoutScreen);
                  },
                  text: "Sign In",
                  height: 40,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: getRegularStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PageName.signUpScreen);
                      },
                      child: Text(
                        "Sign Up",
                        style: getRegularStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
