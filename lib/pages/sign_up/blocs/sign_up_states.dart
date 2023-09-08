class SignUpStates {
  String username, email, password, rePassword;

  SignUpStates({
    this.username = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });

  SignUpStates copyWith({
    String? username,
    email,
    password,
    rePassword,
  }) {
    return SignUpStates(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
