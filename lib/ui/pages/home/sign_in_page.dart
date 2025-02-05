import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:airplane/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text('Log in \nwith your account',
          style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold
          ),
        ),
      );
    }

    Widget inputSection() {

      Widget emailInput() {
        return CustomTextField(
          hightext: 'Email Address',
          hintText: 'Insert Your Email',
          margin: EdgeInsets.only(bottom: 10),
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextField(
          hightext: 'Password',
          hintText: 'Insert Your Password',
          margin: EdgeInsets.only(bottom: 10),
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitBotton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is AuthSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
            }
            else if(state is AuthFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(state.error)
                  )
              );
            }
          },
          builder: (context, state) {

            if(state is AuthLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              margin: EdgeInsets.only(top: 10),
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30
        ),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
                defaultRadius
            )
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitBotton(),

          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('Don\'t have account? Sign Up',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline
            ),),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroudColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin
          ),
          children: [
            title(),
            inputSection(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
