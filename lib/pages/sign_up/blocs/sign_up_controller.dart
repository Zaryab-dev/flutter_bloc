import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/common/Widgets/flutter_toast.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_bloc.dart';

class SignUpController {
  BuildContext context;

  SignUpController({required this.context});

  Future<void> signUpUser() async {
    final state = context.read<SignUpBlocs>().state;
    String email = state.email;
    String password = state.password;
    String username = state.username;
    String rePassword = state.rePassword;


    if(email.isEmpty || password.isEmpty || rePassword.isEmpty || username.isEmpty) {
      toastInfo(msg: 'Empty Credential, Please fill all the fields');
      return;
    }
    if(password != rePassword) {
      toastInfo(msg: 'Password doesn\'t match');
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);


      if(credential.user!=null) {
        credential.user!.sendEmailVerification();
        credential.user!.updateDisplayName(username);
        toastInfo(msg: 'Please verify your email');
        Navigator.pop(context);
      }

    } on FirebaseAuthException catch (e) {
      if(e.code == 'invalid-email') {
        toastInfo(msg: 'Email is invalid');
        return;
      }
      if(e.code == 'weak-password') {
        toastInfo(msg: 'Password is too weak');
        return;
      }
      if(e.code == 'email-already-in-use') {
        toastInfo(msg: 'This email is already in use');
        return;
      }
    }
  }
}
