part of 'login_form_bloc.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

class LoginFormUsernameChanged extends LoginFormEvent {
  final String username;

  LoginFormUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class LoginFormPasswordChanged extends LoginFormEvent {
  final String password;

  LoginFormPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginFormSubmitted extends LoginFormEvent {
  const LoginFormSubmitted();
}
