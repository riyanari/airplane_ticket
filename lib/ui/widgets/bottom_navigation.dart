import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationItem extends StatelessWidget {

  final int index;
  final String imageUrl;

  const BottomNavigationItem({
    Key? key,
    required this.index,
    //required berfungsi agar gambar tidak boleh kosong
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index ? kPrimaryColor : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index ? kPrimaryColor : kTransparentColor,
                borderRadius: BorderRadius.circular(18)
            ),
          )
        ],
      ),
    );
  }
}
