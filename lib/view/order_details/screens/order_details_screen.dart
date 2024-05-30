import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/text/custom_text';
import 'package:texge/view/order_details/widgets/order_header_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final List<Map<String, dynamic>> items = [
      {
        "title": "Casual Shirt Stitching",
        "quantity": 2,
        "status": "Complete",
        "remark": "Embroidery",
      },
      {
        "title": "Formal Pants Stitching",
        "quantity": 3,
        "status": "In Progress",
        "remark": "Hemming",
      },
    ];

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 78, 78, 78),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: whiteColor,
                    )),
                SizedBox(
                  width: size.width * 0.7,
                  child: const Image(
                    image: AssetImage("assets/images/complete_logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const OrderHeaderWidget(),
          Container(
            height: size.height * 0.77,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/bg_image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: blackColor.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              color: blackColor.withOpacity(0.7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomText(
                                    color: whiteColor,
                                    text: item['title'],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      const CustomText(
                                        color: Colors.white70,
                                        text: "Quantity : ",
                                        fontSize: 20,
                                      ),
                                      CustomText(
                                        color: whiteColor,
                                        text: "${item['quantity']}",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const CustomText(
                                        color: Colors.white70,
                                        text: "Status :",
                                        fontSize: 20,
                                      ),
                                      CustomText(
                                        color: whiteColor,
                                        text: item['status'],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const CustomText(
                                        color: Colors.white70,
                                        text: "Remark :",
                                        fontSize: 20,
                                      ),
                                      CustomText(
                                        color: whiteColor,
                                        text: item['remark'],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
