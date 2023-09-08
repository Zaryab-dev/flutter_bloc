abstract class SignUpEvent {
  const SignUpEvent();
}

class UsernameEvent extends SignUpEvent {
  String username;

  UsernameEvent(this.username);
}

class EmailEvent extends SignUpEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  String password;

  PasswordEvent(this.password);
}

class rePasswordEvent extends SignUpEvent {
  String rePassword;

  rePasswordEvent(this.rePassword);
}
