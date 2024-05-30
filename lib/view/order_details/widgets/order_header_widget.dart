import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/text/custom_text';

class OrderHeaderWidget extends StatelessWidget {
  const OrderHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeColor,
      child: const Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Order ID : ",
                  fontSize: 22,
                ),
                CustomText(
                  text: "TXG24/000001",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Order Date :",
                  fontSize: 22,
                ),
                CustomText(
                  text: "12/MAY/2024",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
