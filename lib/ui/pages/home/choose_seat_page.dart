import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {

  final DestinationsModel destinations;

  const ChooseSeatPage(this.destinations,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
            top: 20
        ),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(
            top: 20
        ),
        child: Row(
          children: [
            //Note: Available
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                  right: 6
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_available.png'
                      )
                  )
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),

            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                  right: 6,
                  left: 10
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_selected.png'
                      )
                  )
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),

            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                  right: 6,
                  left: 10
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/ic_unvailable.png'
                      )
                  )
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 30
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor
            ),
            child: Column(
              children: [

                //Note: Seat Alphabet
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'A',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                    Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'B',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                    Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                    Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'C',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                    Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'D',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                  ],
                ),

                //Note: Seat 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'B1',
                      ),
                      Container(
                        height: 48,
                        width: 48,

                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      )
                    ],
                  ),
                ),

                //Note: Seat 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      Container(
                        height: 48,
                        width: 48,

                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      )
                    ],
                  ),
                ),

                //Note: Seat 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      Container(
                        height: 48,
                        width: 48,

                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      )
                    ],
                  ),
                ),

                //Note: Seat 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      Container(
                        height: 48,
                        width: 48,

                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      )
                    ],
                  ),
                ),

                //Note: Seat 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        height: 48,
                        width: 48,

                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      )
                    ],
                  ),
                ),

                //Note: Your Seat
                Container(
                  margin: EdgeInsets.only(
                      top: 30
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyTextStyle.copyWith(
                            fontWeight: light
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium
                        ),
                      )
                    ],
                  ),
                ),

                //Note: Total Price
                Container(
                  margin: EdgeInsets.only(
                      top: 16
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: greyTextStyle.copyWith(
                            fontWeight: light
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0
                        ).format(state.length * destinations.price),
                        style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue to Checkout',
            width: 327,
            onPressed: () {

              int price = destinations.price * state.length;

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  CheckoutPage(
                      TransactionModel(
                          destinations: destinations,
                          amountOfTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: price + (price * 0.5).toInt()
                      ))));
            },
            margin: EdgeInsets.only(bottom: 46),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroudColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 24
        ),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkOutButton()
        ],
      ),
    );
  }
}
