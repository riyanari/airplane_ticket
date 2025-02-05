import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/ui/pages/home/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {

  final DestinationsModel destinations;

  const DestinationCard(
      this.destinations,{
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
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: NetworkImage(
                        destinations.imageUrl,
                      )
                  )
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(18))
                  ),
                  child: Row(
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
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
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
            )
          ],
        ),
      ),
    );
  }
}
