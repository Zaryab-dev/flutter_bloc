

import 'package:flutter/material.dart';
import 'package:flutter_bloc_state/common/entities/colors.dart';
import 'package:flutter_bloc_state/pages/routes/names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Setting/setting_page.dart';

Widget buildProfileAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 15.h,
          width: 20.w,
          child: const Image(image: AssetImage('assets/icons/menu.png')),
        ),
        const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold),),
        IconButton(onPressed: (){
          // Navigator.of(context).pushNamed('/sign_up');
        }, icon: const Icon(Icons.more_vert))
      ],
    ),
  );
}

Widget buildIconAndProfile() {
  return Container(
    alignment: Alignment.bottomRight,
    height: 80.h,
    width: 80.w,
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/icons/headpic.png'))
    ),
      child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage('assets/icons/edit_3.png')),
  );
}

var infoImage = <String, String> {
  'Settings' : 'settings.png',
  'Payments' : 'credit-card.png',
  'Achievement' : 'award.png',
  'Love' : 'heart(1).png',
  'Reminder' : 'cube.png',
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(infoImage.length, (index) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingScreen())),

    child: ListTile(
          leading: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                color: buttonBgColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image(image: AssetImage("assets/icons/${infoImage.values.elementAt(index)}"),fit: BoxFit.fill,),
            ),
          ),
          title: Text('${infoImage.keys.elementAt(index)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),),
        ),
      ))
    ],
  );
}