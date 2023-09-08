import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/app_bloc.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/setting_states.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/settings_bloc.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/setting_widgets.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_blocs.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_events.dart';
import 'package:flutter_bloc_state/pages/routes/names.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_in/sign_in.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_up/sign_up.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void removeUserData() {
    context.read<ApplicationBlocs>().add(TriggerAppEvent(0));
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignUpScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBlocs, SettingsStates>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: logoutWidget(context, () { removeUserData();}),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
