import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/color_manager.dart';
import '../../../../config/themes/text_style.dart';
import '../../../../core/utils/constants_manager.dart';

class CustomModalSheet extends StatelessWidget {
  const CustomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                ConstantsManager.tempeMa3adyGarage,
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // address
                  Row(
                    children: [
                      Text(
                        "جراج المعادي",
                        style:
                            getSemiBoldStyle(fontSize: 16, color: Colors.black),
                      ),
                      const Spacer(),
                      Text(
                        "EGP 50",
                        style: getBoldStyle(
                          fontSize: 16,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorManager.primaryColor,
                        size: 18.sp,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "9134 Holly St, المعادي",
                        style: getRegularStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // rating and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 4),
                          Text(
                            "4.5",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        " 15 /Hour",
                        style: getMediumStyle(
                          fontSize: 12,
                          color: ColorManager.grey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
