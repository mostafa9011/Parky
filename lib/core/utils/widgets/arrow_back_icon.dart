import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parky/config/themes/assets_manager.dart';
import 'package:parky/config/themes/color_manager.dart';

class ArrowBackIcon extends StatelessWidget {
  final Function()? onBack;
  const ArrowBackIcon({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onBack != null) {
          onBack!();
        } else {
          Navigator.pop(context);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeIn,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorManager.transparent,
            border: Border.all(
              color: ColorManager.grey,
              width: 1.w,
            ),
          ),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(
                context.locale.languageCode != 'ar' ? 3.14 : 0),
            child: SvgPicture.asset(
              AssetsManager.backIcon,
              width: 25.w,
              height: 15.h,
            ),
          ),
        ),
      ),
    );
  }
}
