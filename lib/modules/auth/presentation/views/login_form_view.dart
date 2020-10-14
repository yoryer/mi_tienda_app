import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../app/routes/router.gr.dart';
import '../../../../injection_container.dart';
import '../bloc/login_form_bloc.dart';

class LoginFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginFormBloc>(),
      child: _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Error en el inicio de sesión')),
            );
        }

        if (state.status.isSubmissionSuccess) {
          ExtendedNavigator.of(context).pushAndRemoveUntil(Routes.home_page, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mi Tienda'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(18, 24, 18, 24),
          child: Column(
            children: [
              _UsernameInput(),
              SizedBox(height: 18),
              _PasswordInput(),
              SizedBox(height: 24),
              _LoginFormSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          onChanged: (value) => context.bloc<LoginFormBloc>().add(LoginFormUsernameChanged(value)),
          decoration: InputDecoration(
            labelText: 'Usuario',
            errorText: state.username.invalid ? 'Usuario no válido' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (value) => context.bloc<LoginFormBloc>().add(LoginFormPasswordChanged(value)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            errorText: state.password.invalid ? 'Contraseña no válida' : null,
          ),
        );
      },
    );
  }
}

class _LoginFormSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                child: const Text('Iniciar sesión'),
                onPressed: state.status.isValidated
                    ? () {
                        context.bloc<LoginFormBloc>().add(const LoginFormSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
