import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/payment_url.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentUrl>> payThroughExternalUrl(
    String id,
    String label,
    double amount,
  );
}
