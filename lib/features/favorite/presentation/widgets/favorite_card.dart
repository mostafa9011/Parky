import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/themes/color_manager.dart';
import 'package:parky/config/themes/text_style.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
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
                Text(
                  "Bamboo Parking",
                  style: getSemiBoldStyle(fontSize: 16, color: Colors.black),
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
                      "9134 Holly St, Maryland",
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
                      "EGP 50 /Hour",
                      style: getBoldStyle(
                        fontSize: 14,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
