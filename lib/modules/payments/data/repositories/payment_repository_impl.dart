import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../datasources/adamspay_remote_data_source.dart';
import '../../domain/entities/payment_url.dart';
import '../../domain/repositories/payment_repository.dart';
import 'package:meta/meta.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final AdamsPayRemoteDataSource adamsPayRemoteDataSource;

  PaymentRepositoryImpl({
    @required this.adamsPayRemoteDataSource,
  });

  @override
  Future<Either<Failure, PaymentUrl>> payThroughExternalUrl(
    String id,
    String label,
    double amount,
  ) async {
    try {
      final String paymentUrl = await adamsPayRemoteDataSource.createDebt(
        id,
        label,
        amount,
      );
      if (paymentUrl != null) {
        return Right(PaymentUrl(url: paymentUrl));
      }
      return Left(ServerFailure());
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
