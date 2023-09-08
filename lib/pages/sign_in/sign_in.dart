import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/routes/names.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_bloc_state/pages/sign_in/sign_controller.dart';
import 'package:flutter_bloc_state/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_bloc_state/pages/sign_up/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/sign_in_states.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<SignInBloc, SignInState> (
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                appBar: buildAppBar('Log In'),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildThirdPartyLogin(context),
                      reuseAbleText('or use your email account to login'),
                      Container(
                        margin: EdgeInsets.only(top: 60.h),
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reuseAbleText('Email'),
                            buildTextInput((value) {
                              context.read<SignInBloc>().add(EmailEvent(email: value));
                            }, Icons.email, TextInputType.emailAddress, TextInputAction.next, 'Email'),
                            SizedBox(height: 11.h,),
                            reuseAbleText('Password'),
                            buildTextInput((value) {
                              context.read<SignInBloc>().add(PasswordEvent(password: value));
                            }, Icons.lock_outline, TextInputType.visiblePassword, TextInputAction.done, 'Password'),
                            SizedBox(height: 11.h,),
                            forgetPassword('Forget Password?'),
                            buildButton('Log In', Colors.deepPurpleAccent, Colors.white, (){
                              SignInController(context: context).handelSignIn('email');
                            }),
                            buildButton('Sign Up', Colors.white, Colors.black, (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
