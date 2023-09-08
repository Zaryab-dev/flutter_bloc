import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/Widgets/flutter_toast.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handelSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress.toString(), password: password.toString()
          );
          if (credential.user == null) {
            toastInfo(msg: 'Non user exist for this email');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email first');
            return;
          }
          var user = credential.user;
          if (user != null) {
            toastInfo(msg: 'User Logged Successfully!');
            Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
            return;
          }else{
            toastInfo(msg: 'Currently there is no user for this email');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if(e.code == 'user-not-found') {
            print('There is no user for that email');
            toastInfo(msg: 'Did\'t find user for this email');
            return;
          }
          else if(e.code == 'wrong-password') {
            print('Password is wrong');
            toastInfo(msg: 'Password is wrong');
            return;
          }
          else if(e.code == 'invalid-email') {
            print('Your email address is not correct');
            toastInfo(msg: 'You need to provide correct email');
            return;
          }
        }
      }
    } catch (e) {
      print('${e.toString()} 2nd ');
    }
  }
}
