import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/color_manager.dart';
import 'package:parky/config/themes/text_style.dart';

import '../../../auth/presentation/widgets/image_sourse_dialog.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, this.enableEdit = false});
  final bool enableEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mostafa Mohamed',
                style: getBoldStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                'mostafa@gmail.com',
                style: getRegularStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          if (enableEdit) ...{
            IconButton(
              onPressed: () {
                showImageSourceDialog(context);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          },
        ],
      ),
    );
  }
}
