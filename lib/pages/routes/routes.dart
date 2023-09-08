import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/global.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/settings_bloc.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/setting_page.dart';
import 'package:flutter_bloc_state/pages/Profile/profile_page.dart';
import 'package:flutter_bloc_state/pages/application_pages/application_pages.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_blocs.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_blocs.dart';
import 'package:flutter_bloc_state/pages/home_pages/home_page.dart';
import 'package:flutter_bloc_state/pages/routes/names.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_in/sign_in.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_up/sign_up.dart';
import 'package:flutter_bloc_state/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc_state/pages/welcome/welcome_screen.dart';
import 'package:flutter_bloc_state/services/storage_services.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          page: WelcomeScreen(),
          route: AppRoutes.INITIAL,
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          page: SignInScreen(),
          route: AppRoutes.SIGNIN,
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          page: SignUpScreen(),
          route: AppRoutes.SIGNUP,
          bloc: BlocProvider(
            create: (_) => SignUpBlocs(),
          )),
      PageEntity(
        page: ApplicationPages(), route: AppRoutes.APPLICATION,
        bloc: BlocProvider(create: (_) => ApplicationBlocs(),),
      ),
      PageEntity(
        page: HomeScreen(), route: AppRoutes.HOME_SCREEN,
        bloc: BlocProvider(create: (_) => HomePageBlocs(),),
      ),
      PageEntity(
        page: const SettingScreen(),
        route: AppRoutes.SETTING,
        bloc: BlocProvider(create: (_) => SettingBlocs(),),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for(var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if(settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty) {
        if(FirebaseAuth.instance.currentUser != null) {
          return MaterialPageRoute(builder: (_) => const ApplicationPages(), settings: settings);
        }
        if(Global.storageServices.getDeviceOpen() ) {
          return MaterialPageRoute(builder: (_) => SignInScreen(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => SignInScreen());
  }
}


class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.page, required this.route, this.bloc});
}
