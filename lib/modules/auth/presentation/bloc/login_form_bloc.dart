import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/login.dart';
import '../models/password.dart';
import '../models/username.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final Login _login;

  LoginFormBloc({
    @required Login login,
  })  : assert(login != null),
        _login = login,
        super(LoginFormState());

  @override
  Stream<LoginFormState> mapEventToState(
    LoginFormEvent event,
  ) async* {
    if (event is LoginFormUsernameChanged) {
      yield _mapLoginFormUsernameChangedToState(event, state);
    }

    if (event is LoginFormPasswordChanged) {
      yield _mapLoginFormPasswordChangedToState(event, state);
    }

    if (event is LoginFormSubmitted) {
      yield* _mapLoginFormSubmittedChangedToState(event, state);
    }
  }

  LoginFormState _mapLoginFormUsernameChangedToState(
    LoginFormUsernameChanged event,
    LoginFormState state,
  ) {
    final username = Username.dirty(event.username);
    return state.copyWith(
      username: username,
      status: Formz.validate([username, state.password]),
    );
  }

  LoginFormState _mapLoginFormPasswordChangedToState(
    LoginFormPasswordChanged event,
    LoginFormState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<LoginFormState> _mapLoginFormSubmittedChangedToState(
    LoginFormSubmitted event,
    LoginFormState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _login.call(Params(
          username: state.username.value,
          password: state.password.value,
        ));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
