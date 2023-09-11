import 'package:cleancodepart1/core/error/failures.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTrivalReponsitory {
  Future<Either<Failure, NumberTrival>> getNumberTrival(int number);
  Future<Either<Failure, NumberTrival>> getRandomNumberTrival();
}