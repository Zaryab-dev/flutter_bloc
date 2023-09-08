import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/entities/colors.dart';
import 'package:flutter_bloc_state/pages/application_pages/application_widgets.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_blocs.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_events.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPages extends StatefulWidget {
  const ApplicationPages({super.key});

  @override
  State<ApplicationPages> createState() => _ApplicationPagesState();
}

class _ApplicationPagesState extends State<ApplicationPages> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBlocs, ApplicationStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: widget[state.index],
            bottomNavigationBar: Container(
              height: 50.h,
              width: 375.w,
              decoration: const BoxDecoration(
                // color: Colors.black12,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22,), topRight: Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey6,
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]
              ),
              child: BottomNavigationBar(
                backgroundColor: state.index == 0 ? Colors.black: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.index,
                elevation: 0,
                selectedItemColor: buttonBgColor,
                unselectedItemColor: textColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (value) {
                  context.read<ApplicationBlocs>().add(TriggerAppEvent(value));
                },
                items: [
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/home.png'),
                      ),activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/icons/home.png',color: buttonBgColor,)
                  )),
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/search2.png'),
                      ),activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/icons/search2.png',color: buttonBgColor,)
                  )),
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/play-circle1.png'),
                      ),activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/icons/play-circle1.png',color: buttonBgColor,)
                  )),
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/message-circle.png'),
                      ),activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/icons/message-circle.png',color: buttonBgColor,)
                  )),
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/person.png'),
                      ),activeIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/icons/person.png',color: buttonBgColor,)
                  )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
