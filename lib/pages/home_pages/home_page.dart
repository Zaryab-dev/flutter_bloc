import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/entities/colors.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/setting_page.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_blocs.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_states.dart';
import 'package:flutter_bloc_state/pages/home_pages/home_page_widgets.dart';
import 'package:flutter_bloc_state/pages/routes/names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15.h,
                width: 20.h,
                child: Image.asset('assets/icons/menu.png'),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingScreen()));
                },
                child: SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: Image.asset('assets/icons/person.png'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomePageBlocs, HomePageStates> (
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverPadding(padding :EdgeInsets.only(top: 16.h)),
                SliverToBoxAdapter(child: homePageText('Hi,', textColor)),
                SliverToBoxAdapter(child: homePageText('ZARYAB', Colors.black)),
                SliverPadding(padding :EdgeInsets.only(top: 16.h)),
                SliverToBoxAdapter(child: searchView()),
                SliverPadding(padding :EdgeInsets.only(top: 16.h)),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(padding :EdgeInsets.only(top: 16.h),
                  sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                      (context, index) {
                        return Container(
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(image: AssetImage("assets/icons/image(13).png"),fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Flutter Best Course For CS Students', textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold),),
                              Text('Flutter Course', textAlign: TextAlign.left, overflow: TextOverflow.fade, maxLines: 1, style: TextStyle(color: textColor, fontSize: 11.sp, fontWeight: FontWeight.normal),),
                            ],
                          ),
                        );
                      }
                  ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
