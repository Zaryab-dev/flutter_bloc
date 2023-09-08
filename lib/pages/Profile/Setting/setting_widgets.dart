

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget logoutWidget(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure to logout?'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('Cancel')),
            TextButton(onPressed: func, child: Text('Confirm')),
          ],
        );
      });
    },
    child: const SizedBox(
      height: 100,
      child: Image(
        image: AssetImage('assets/icons/Logout.png'),fit: BoxFit.cover,),
    ),
  );
}