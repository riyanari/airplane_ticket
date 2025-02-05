import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destinations_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/pages/home/bonus_page.dart';
import 'package:airplane/ui/pages/home/get_started_page.dart';
import 'package:airplane/ui/pages/home/home_page.dart';
import 'package:airplane/ui/pages/home/main_page.dart';
import 'package:airplane/ui/pages/home/sign_in_page.dart';
import 'package:airplane/ui/pages/home/sign_up_page.dart';
import 'package:airplane/ui/pages/home/splashPage.dart';
import 'package:airplane/ui/pages/home/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PageCubit()
        ),
        BlocProvider(
            create: (context) => AuthCubit()
        ),
        BlocProvider(
            create: (context) => DestinationsCubit()
        ),
        BlocProvider(
            create: (context) => SeatCubit()
        ),
        BlocProvider(
            create: (context)=>TransactionCubit()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/home': (context) => HomePage(),
          '/success-checkout': (context) => SuccessCheckoutPage()
        },
      ),
    );
  }
}
