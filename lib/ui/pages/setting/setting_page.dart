import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AuthFailed){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error)
              )
          );
        } else if(state is AuthInitial){
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false
          );
        }
      },
      builder: (context, state) {

        if(state is AuthLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
            child: CustomButton(
              title: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            )
        );
      },
    );
  }
}
