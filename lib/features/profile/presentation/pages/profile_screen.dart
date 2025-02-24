import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/text_style.dart';
import 'package:parky/core/utils/widgets/custom_elevated_button.dart';

import '../../../../config/routes/page_name.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          const ProfileCard(),
          // my account
          const ProfileItem(
            title: 'My Account',
            subTitle: 'Edit your account details',
            icon: Icons.person_2_outlined,
          ),
          // family comunity
          const ProfileItem(
            title: 'Family Comunity',
            subTitle: 'Join your family comunity',
            icon: Icons.people_outline,
          ),
          // notifications
          const ProfileItem(
            title: 'Notifications',
            subTitle: 'Enable or disable notifications',
            icon: Icons.notifications_none,
            isNotification: true,
          ),
          //Two-Factor Authentication
          const ProfileItem(
            title: 'Two-Factor Authentication',
            subTitle: 'Enable or disable two-factor authentication',
            icon: Icons.security_rounded,
          ),
          // logout
          ProfileItem(
            onPressed: () {
              // show modalbottomsheet
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 170.h,
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Text(
                          'Are you sure you want to logout?',
                          style: getBoldStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                borderColor: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    PageName.loginScreen,
                                    (route) => false,
                                  );
                                },
                                text: 'Logout',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            title: 'Logout',
            subTitle: 'Logout from your account',
            icon: Icons.logout_outlined,
          ),
        ],
      ),
    );
  }
}
