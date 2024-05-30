import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/size/constant_width.dart';
import 'package:texge/utils/text/custom_text';
import 'package:texge/view/order_details/screens/order_details_screen.dart';

class OrderListWidget extends StatelessWidget {
  final String status;
  final String orderId;
  final String date;
  final String totalItems;
  const OrderListWidget({
    super.key,
    required this.status,
    required this.orderId,
    required this.date,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: themeColor.withOpacity(0.7),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 5.0),
            child: Container(
              color: const Color.fromARGB(255, 227, 206, 183).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 10, right: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: size.width * 0.17,
                            decoration: const BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CustomText(
                                text: status,
                                color: Colors.red,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        const KWidth(size: 0.18),
                        const CustomText(
                          text: "Order ID : ",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                        CustomText(
                          text: orderId,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const KWidth(size: 0.18),
                        const CustomText(
                          text: "Delivery Date : ",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                        CustomText(
                          text: date,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const KWidth(size: 0.18),
                            const CustomText(
                              text: "Total Items : ",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: whiteColor,
                            ),
                            CustomText(
                              text: totalItems,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(themeColor),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const OrderDetailsScreen(),
                              ));
                            },
                            child: const CustomText(
                              text: "View",
                              color: whiteColor,
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
