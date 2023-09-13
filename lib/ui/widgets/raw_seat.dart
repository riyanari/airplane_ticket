// import 'package:airplane/shared/theme.dart';
// import 'package:airplane/ui/widgets/seat_item.dart';
// import 'package:flutter/material.dart';
//
// class RawSeat extends StatelessWidget {
//
//   final String seatRaw;
//   final String id;
//   final int statusSeatA;
//   final int statusSeatB;
//   final int statusSeatC;
//   final int statusSeatD;
//
//   const RawSeat({
//     Key? key,
//     required this.seatRaw,
//     required this.id,
//     required this.statusSeatA,
//     required this.statusSeatB,
//     required this.statusSeatC,
//     required this.statusSeatD,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SeatItem(
//               status: statusSeatA,
//               id: id,
//           ),
//           SeatItem(
//               status: statusSeatB,
//             id: id,
//           ),
//           Container(
//             height: 48,
//             width: 48,
//
//             child: Center(
//               child: Text(
//                 seatRaw,
//                 style: greyTextStyle.copyWith(
//                     fontSize: 16
//                 ),
//               ),
//             ),
//           ),
//           SeatItem(
//               status: statusSeatC,
//             id: id,
//           ),
//           SeatItem(
//               status: statusSeatD,
//             id: id,
//           )
//         ],
//       ),
//     );
//   }
// }
