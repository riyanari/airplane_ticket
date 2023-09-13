import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {

  final String title;
  final String value;
  final Color valueColor;

  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.value,
    required this.valueColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/ic_check.png'
                    )
                )
            ),
          ),
          Text(
              title,
              style: blackTextStyle
          ),
          Spacer(),
          Text(
            value,
            style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              color: valueColor
            ),
          )
        ],
      ),
    );
  }
}
