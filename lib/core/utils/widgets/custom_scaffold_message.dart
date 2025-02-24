import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/utils/functions/kprint.dart';

import '../../../config/themes/text_style.dart';

showScaffoldMessage(BuildContext context, {String? message}) {
  kprint("showScaffoldMessage"); 
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 4),
      elevation: 0,
      content: Container(
        margin: EdgeInsets.only(bottom: 50.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              color: Colors.green,
              size: 24.sp,
            ),
            SizedBox(width: 10.w),
            Flexible(
              child: Text(
                message ?? "Will comming soon",
                style: getMediumStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
