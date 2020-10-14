import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Right(User(
      email: 'user@example.com',
      name: 'Jonh Appleseed',
    ));
  }

  @override
  void logout() {
    // TODO: implement logout
  }
}
