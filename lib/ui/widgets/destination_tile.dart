import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

import '../pages/home/detail_page.dart';

class DestinationTail extends StatelessWidget {

  final DestinationsModel destinations;

  const DestinationTail(this.destinations,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(destinations),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 8
        ),
        padding: const EdgeInsets.all(10),
        decoration:BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destinations.imageUrl
                  )
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destinations.city,
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
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/ic_star.png'
                          )
                      )
                  ),
                ),
                Text(
                  destinations.rating.toString(),
                  style: blackTextStyle.copyWith(
                      fontWeight: medium
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
