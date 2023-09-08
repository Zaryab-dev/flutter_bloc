import 'package:flutter/material.dart';
import 'package:flutter_bloc_state/pages/Profile/profile_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildProfileAppBar(context),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h,),
            Container(
              child: buildIconAndProfile(),
            ),
            buildListView(context),
          ],
        ),
      ),
    );
  }
}
