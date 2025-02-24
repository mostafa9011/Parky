import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/config/routes/page_name.dart';

import '../widgets/transaction_item.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الكارد الرئيسي (المحفظة)
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // البطاقة الخضراء
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Parky",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "34,378,4 EGP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Number",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                      "3554 7634 2647 0237",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Exp",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                      "24/26",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // زر الاستقبال
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.download, color: Colors.green),
                          label: const Text("Receive"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // const Spacer(),
              // زر "إضافة بطاقة"
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                // dashPattern: const [6, 3],
                color: Colors.grey,
                strokeWidth: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageName.addCardScreen);
                  },
                  child: Container(
                    width: 70.w,
                    height: 155.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(Icons.add, color: Colors.green, size: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // العنوان "Transaction History"
          const Text(
            "Transaction History",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // قائمة العمليات
          Expanded(
            child: ListView(
              children: const [
                TransactionItem(
                    title: "Added Money",
                    date: "Sunday, 8 Jan 22",
                    amount: "+29,00EGP",
                    color: Colors.green),
                TransactionItem(
                    title: "Added Money",
                    date: "Sunday, 8 Jan 22",
                    amount: "+29,00EGP",
                    color: Colors.green),
                TransactionItem(
                    title: "Added Money",
                    date: "Sunday, 8 Jan 22",
                    amount: "-29,00EGP",
                    color: Colors.red),
                TransactionItem(
                  title: "Added Money",
                  date: "Sunday, 8 Jan 22",
                  amount: "-29,00EGP",
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
