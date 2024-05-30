import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
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
    );
  }
}
