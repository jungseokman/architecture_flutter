import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // final advice = await adviceRepo.getAdviceFromDatasource();
    // return advice;

    return adviceRepo.getAdviceFromDatasource();
  }
}
