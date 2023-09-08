import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_blocs.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_events.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/colors.dart';

Widget homePageText(String title, Color color) {
  return Container(
    child: Text(
      title,
      style:
      TextStyle(color: color, fontSize: 22.sp, fontWeight: FontWeight.bold),
    ),
  );
}

// for searchView

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 40.h,
        width: 280.w,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'Search your course',
              prefixIcon: Icon(
                Icons.search,
                color: textColor,
              ),
              hintStyle: TextStyle(color: textColor),
              contentPadding: EdgeInsets.all(10.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: textColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.deepPurple),
              )),
          enabled: true,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: buttonBgColor, borderRadius: BorderRadius.circular(15)),
        height: 40.h,
        width: 40.w,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset(
            'assets/icons/options.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    ],
  );
}

//for slidersView

Widget slidersView(BuildContext context , HomePageStates states) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Container(
          height: 160.h,
          width: 325.w,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBlocs>().add(HomePageDots(value));
            },
            children: [
              Container(
                  height: 160.h, width: 325.w, decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icons/Art.png',),fit: BoxFit.fill)
              ),),
              Container(
                  height: 160.h, width: 350.w, decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icons/Image(1).png'),fit: BoxFit.fill)
              ),),
              Container(
                  height: 160.h, width: 350.w, decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icons/Image(2).png'),fit: BoxFit.fill)
              ),),
            ],
          ),
        ),
      ),
      SizedBox(height: 6.h,),
      DotsIndicator(
          position: states.index,
          dotsCount: 3),
    ],
  );
}

//for menu

Widget menuView() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          reusableText('Choose your course', Colors.black, 16, FontWeight.bold),
          Row(
            children: [
              reusableText('See All', textColor, 14, FontWeight.normal),
              const Icon(Icons.arrow_right_outlined, color: textColor,)
            ],
          )
        ],
      ),
      Row(children: [
        _reusableContainer('All'),
        _reusableContainer('Popular', bg: Colors.white, textColor: textColor),
        _reusableContainer('Newest', bg: Colors.white, textColor: textColor),
      ],)
    ],
  );

}

Widget reusableText(String text, Color color, int fontSize, FontWeight fontWeight) {
  return Container(
    child: Text(text, style: TextStyle(fontWeight: fontWeight, fontSize: fontSize.sp,color: color),),
  );
}

Widget _reusableContainer(String text ,{Color bg = deepColor, textColor = Colors.white}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w, top: 15.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
    decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Center(child: reusableText(text, textColor, 14, FontWeight.bold)),
  );
}