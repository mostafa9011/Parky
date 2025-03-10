import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:parky/config/themes/assets_manager.dart';
import 'package:parky/core/utils/widgets/circular_image.dart';

import '../../../../config/themes/text_style.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,

        children: [
          SlidableAction(
            onPressed: (context) {},
            // backgroundColor: Colors.grey,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(14),
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.only(bottom: 10.w),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const CircularImage(
                assetsImage: AssetsManager.parkingIcon,
                radius: 22,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification Title",
                    style: getRegularStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Notification Subheading",
                    style: getRegularStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "4:30 PM",
                style: getRegularStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
