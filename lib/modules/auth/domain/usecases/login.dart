import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class Login implements UseCase<User, Params> {
  final UserRepository userRepository;

  Login({
    @required this.userRepository,
  });

  @override
  Future<Either<Failure, User>> call(params) async {
    return await userRepository.login(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
