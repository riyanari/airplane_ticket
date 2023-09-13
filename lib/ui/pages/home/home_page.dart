import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destinations_cubit.dart';
import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<DestinationsCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: 16
              ),
              child: Row(
                children: [
                  //expanded berfungsi agar tidak ada overflow
                  // jika text terlalu panjang. berbeda dengan mainAxis
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/img_profile2.png',
                          ),
                        )
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationsModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationsModel destinations){
              return DestinationCard(destinations);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationsModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
            top: 18,
            left: defaultMargin,
            right: defaultMargin,
            bottom: 100
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold
              ),
            ),
            Column(
              children: destinations.map((DestinationsModel destinations){
                return DestinationTail(destinations);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationsCubit, DestinationsState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is DestinationsFailed){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error)
              )
          );
        }
      },
      builder: (context, state) {

        if(state is DestinationsSuccess){
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(state.destinations)
            ],
          );
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
