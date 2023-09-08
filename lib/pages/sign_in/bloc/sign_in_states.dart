class SignInState {
  final String email, password;

  SignInState({this.email = '', this.password = ''});

  SignInState copyWith({
    String? email,
    password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
