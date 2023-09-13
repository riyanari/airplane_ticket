import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photos_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {

  final DestinationsModel destinations;

  const DetailPage(
      this.destinations,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 360,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destinations.imageUrl
            )
          )
        ),
      );
    }

    Widget customShadow(){
      return Container(
        height: 124,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ]
          )
        ),
      );
    }

    Widget content(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          children: [
            //NOTE: Emblem
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(
                  top: 30
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_emblem.png'
                  )
                )
              ),
            ),

            //Note: Title
            Container(
              margin: const EdgeInsets.only(
                top: 176
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinations.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destinations.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light
                          ),
                        ),
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
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //Note: Description
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 20
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Note: About
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja\nserta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                      height: 2
                    ),
                  ),

                  //Note: PHOTOS
                  const SizedBox(height: 20,),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    children: const [
                      PhotosDetail(
                        imageUrl: 'assets/img_photo1.png',
                      ),
                      PhotosDetail(
                        imageUrl: 'assets/img_photo2.png',
                      ),
                      PhotosDetail(
                        imageUrl: 'assets/img_photo3.png',
                      )
                    ],
                  ),

                  //Note: Interest
                  const SizedBox(height: 20,),
                  Text(
                    'Interest',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    children: const [
                      InterestItem(
                        name: 'Kids Park',
                      ),
                      InterestItem(
                        name: 'Honor Bridge',
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      InterestItem(
                        name: 'City Museum',
                      ),
                      InterestItem(
                        name: 'Central Mall',
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Note: Price & Book Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                  vertical: 30
              ),
              child: Row(
                children: [
                  //Note: Pice
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                            decimalDigits: 0
                          ).format(destinations.price),
                          style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium
                          ),
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(
                              fontWeight: light
                          ),
                        )
                      ]
                    ),
                  ),
                  //Note: Book Button
                  CustomButton(
                      title: 'Book Now',
                      width: 170,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=> ChooseSeatPage(destinations),
                            )
                        );
                      }
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroudColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content()
          ],
        ),
      ),
    );
  }
}
