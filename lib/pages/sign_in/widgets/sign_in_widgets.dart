import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: CupertinoColors.systemGrey5,
          height: 1,
        )),
    title: Text(
      title,
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 50.h, right: 50.h, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _reUsableIcon('google'),
        _reUsableIcon('apple'),
        _reUsableIcon('facebook'),
      ],
    ),
  );
}

Widget _reUsableIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.w,
      width: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reuseAbleText(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      title,
      style: const TextStyle(
        color: CupertinoColors.systemGrey,
      ),
    ),
  );
}

Widget forgetPassword(String title) {
  return Container(
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline,decorationColor: CupertinoColors.activeBlue,),),
  );
}

Widget buildButton(String title , Color color,textColor , void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: color == Colors.deepPurpleAccent ? 60.h : 20.h),
      height: 40.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(color: Colors.black12, width: 1)
      ),
      child: Center(child: Text(title, style: TextStyle(color: textColor,fontWeight: FontWeight.w500, fontSize: 16.sp,),),),
    ),
  );
}
     Widget buildTextInput(void Function(String value,)? func, IconData iconData, TextInputType type, TextInputAction action, String title,) {
          const bool obscure = false;
          return TextFormField(
// controller: controller,
    onChanged: (value) => func!(value),
    textInputAction: action,
    keyboardType: type,
    autocorrect: false,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: title,
      prefixIcon: Icon(iconData),
      contentPadding: EdgeInsets.all(15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: CupertinoColors.systemGrey5,
    ),
  );
}