import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_started.jpg')
              )
            ),
          ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  'Fly Like a Dragon',
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold
                ),
              ),
              SizedBox(
                height: 10,
                
              ),
              Text(
                'Explore new world with us and let \nyourself get an amazing experiences',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
                textAlign: TextAlign.center,
              ),
             CustomButton(
               title: 'Get Started',
               width: 220,
               onPressed: (){
                 Navigator.pushNamed(context, '/sign-up');
               },
               margin: EdgeInsets.only(top: 40, bottom: 50),
             )
            ],
          ),
          )
        ],
      ),
    );
  }
}
