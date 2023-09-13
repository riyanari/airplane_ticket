import 'package:airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'booking_detail_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //note: destination tile
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            transaction.destinations.imageUrl
                        )
                    )
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destinations.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destinations.city,
                      style: greyTextStyle.copyWith(
                          fontWeight: light
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ic_star.png'
                            )
                        )
                    ),
                  ),
                  Text(
                    transaction.destinations.rating.toString(),
                    style: blackTextStyle.copyWith(
                        fontWeight: medium
                    ),
                  )
                ],
              ),
            ],
          ),

          //note: booking detail
          Container(
            margin: EdgeInsets.only(
                top: 30
            ),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold
              ),
            ),
          ),

          //Note: Booking detail item
          BookingDetailItem(
            title: 'Traveler',
            value: '${transaction.amountOfTraveler} Person',
            valueColor: kBlackColor,
          ),

          BookingDetailItem(
            title: 'Seat',
            value: transaction.selectedSeats,
            valueColor: kBlackColor,
          ),

          BookingDetailItem(
            title: 'Insurance',
            value: transaction.insurance ? 'YES' : 'NO',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'Refundable',
            value: transaction.refundable ? 'YES' : 'NO',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'Vat',
            value: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Price',
            value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0
            ).format(transaction.price),
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Grand Total',
            value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0
            ).format(transaction.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
