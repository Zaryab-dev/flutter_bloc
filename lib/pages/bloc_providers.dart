
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/settings_bloc.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_blocs.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_blocs.dart';
import 'package:flutter_bloc_state/pages/routes/routes.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:flutter_bloc_state/pages/welcome/bloc/welcome_blocs.dart';

import '../app_bloc.dart';

class AppBlockProviders{
  static get allBlocProviders => [

    // BlocProvider(create: (context) => AppBlocs()),
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => SignUpBlocs()),
    BlocProvider(create: (context) => ApplicationBlocs()),
    BlocProvider(create: (context) => HomePageBlocs()),
    BlocProvider(create: (context) => SettingBlocs()),

    // AppPages.allBlocProviders(),
  ];
}