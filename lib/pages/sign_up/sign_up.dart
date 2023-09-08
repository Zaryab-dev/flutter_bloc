import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/entities/colors.dart';
import 'package:flutter_bloc_state/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_controller.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_events.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs,SignUpStates>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h,),
                    reuseAbleText('Please enter your details & free sign up'),
                    Container(
                      margin: EdgeInsets.only(top: 50.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText('Username'),
                          buildTextInput((value) {
                            context.read<SignUpBlocs>().add(UsernameEvent(value));
                          }, Icons.person, TextInputType.emailAddress, TextInputAction.next, 'Enter your username'),
                          SizedBox(height: 11.h,),
                          reuseAbleText('Email'),
                          buildTextInput((value) {
                            context.read<SignUpBlocs>().add(EmailEvent(value));
                          }, Icons.email, TextInputType.emailAddress, TextInputAction.next, 'Enter your Email'),
                          SizedBox(height: 11.h,),
                          reuseAbleText('Password'),
                          buildTextInput((value) {
                            context.read<SignUpBlocs>().add(PasswordEvent(value));
                          }, Icons.lock_outline, TextInputType.visiblePassword, TextInputAction.next, 'Enter your Password'),
                          SizedBox(height: 11.h,),
                          reuseAbleText('Confirm Password'),
                          buildTextInput((value) {
                            context.read<SignUpBlocs>().add(rePasswordEvent(value));
                          }, Icons.lock_outline, TextInputType.visiblePassword, TextInputAction.done, 'Confirm your Password'),
                          SizedBox(height: 11.h,),
                          reuseAbleText('By creating an account you have to agree with our terms and conditions'),
                          buildButton('Sign Up', buttonBgColor, Colors.white, (){
                            SignUpController(context: context).signUpUser();
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
