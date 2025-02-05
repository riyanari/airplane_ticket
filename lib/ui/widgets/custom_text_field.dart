import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextField extends StatelessWidget {

  final String hightext;
  final EdgeInsets margin;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hightext,
    this.margin = EdgeInsets.zero,
    required this.hintText,
    this.obscureText =false,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hightext,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        defaultRadius
                    ),
                    borderSide: BorderSide(
                        color: kPrimaryColor
                    )
                )
            ),
          ),
        ],
      ),
    );
  }
}
