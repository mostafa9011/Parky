import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/color_manager.dart';
import 'package:parky/config/themes/text_style.dart';
import 'package:parky/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/constants_manager.dart';
import '../../../auth/data/models/register_model.dart';
import '../../../auth/presentation/widgets/image_sourse_dialog.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, this.enableEdit = false});
  final bool enableEdit;

  @override
  Widget build(BuildContext context) {
    RegisterModel registerModel = RegisterModel();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is GetProfileLoading,
          child: Container(
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
                    ConstantsManager.tempProfileImage,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${registerModel.firstNameController.text} ${registerModel.lastNameController.text}",
                      style: getBoldStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      registerModel.emailController.text,
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
          ),
        );
      },
    );
  }
}
