import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/payment_url.dart';
import '../repositories/payment_repository.dart';

class PayThroughExternalUrl extends UseCase<PaymentUrl, Params> {
  final PaymentRepository paymentRepository;

  PayThroughExternalUrl({
    @required this.paymentRepository,
  });

  @override
  Future<Either<Failure, PaymentUrl>> call(Params params) async {
    return await paymentRepository.payThroughExternalUrl(
      params.id,
      params.label,
      params.amount,
    );
  }
}

class Params extends Equatable {
  final String id;
  final String label;
  final double amount;

  Params({
    @required this.id,
    @required this.label,
    @required this.amount,
  });

  @override
  List<Object> get props => [id, label, amount];
}
