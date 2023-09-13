import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:airplane/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text('Join Us and get\nyour next journey',
          style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextField(
          hightext: 'Full Name',
          hintText: 'Insert Full Name',
          margin: EdgeInsets.only(bottom: 10),
          controller: nameController,

        );
      }

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

      Widget hobbyInput() {
        return CustomTextField(
          hightext: 'Hobby',
          hintText: 'Insert Your Hobby',
          margin: EdgeInsets.only(bottom: 20),
          controller: hobbyController,
        );
      }

      Widget submitBotton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is AuthSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/bonus', (route) => false);
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
              title: 'Sign Up',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  hobby: hobbyController.text
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
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitBotton(),

          ],
        ),
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('Have an account? Sign In',
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
            signInButton()
          ],
        ),
      ),
    );
  }
}
