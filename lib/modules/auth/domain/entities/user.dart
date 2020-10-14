import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String name;
  final String email;

  User({
    @required this.name,
    @required this.email,
  });

  @override
  List<Object> get props => [name, email];
}
