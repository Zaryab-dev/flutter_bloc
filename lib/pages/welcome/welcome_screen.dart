import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/entities/colors.dart';
import 'package:flutter_bloc_state/constant/constants.dart';
import 'package:flutter_bloc_state/global.dart';
import 'package:flutter_bloc_state/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_event.dart';
import 'bloc/welcome_states.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeStates>(builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 50.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page("First See Learning", 'Weaknesses are just strengths in the wrong environment', 'assets/images/reading.png', 'Next', 1),
                    _page("Connect with everyone", 'Real change, enduring change, happens one step at a time', 'assets/images/boy.png', 'Next', 2),
                    _page("Always Fascinated Learning", 'You have to be where you are to get where you need to go', 'assets/images/man.png', 'Get Started', 3),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  // left: 100.w,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      activeColor: deepColor,
                      color: CupertinoColors.systemGrey3,
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      size: const Size(13, 12),
                      activeSize: const Size(28, 10),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
  Widget _page(String title, subtitle, imagePath, buttonName, int index) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath,fit: BoxFit.cover,),
        ),
        Container(
          child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 24.sp),
              )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            subtitle,
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 80.h,
        ),
        GestureDetector(
          onTap: () {
            if(index<3) {
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            }else{
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              Global.storageServices.setBool(STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("The value is ${Global.storageServices.getDeviceOpen()}");
              Navigator.of(context).pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            width: 350.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: buttonBgColor,
                borderRadius: BorderRadius.circular(10.h),
                boxShadow: const [
                  BoxShadow(
                      color: CupertinoColors.systemGrey4,
                      offset: Offset(0, 2),
                      blurRadius: 1,
                      spreadRadius: 2)
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
