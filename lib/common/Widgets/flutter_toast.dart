

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
}){
  return Fluttertoast.showToast(msg: msg,
  gravity: ToastGravity.TOP,
    fontSize: 15.sp
  );
}