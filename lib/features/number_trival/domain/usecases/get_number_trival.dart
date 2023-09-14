import 'package:cleancodepart1/core/error/failures.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:cleancodepart1/features/number_trival/domain/reponsitories/NumberTrivalReponsitory.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetNumberTrival {
  final NumberTrivalReponsitory numberTrivalReponsitory;

  GetNumberTrival(this.numberTrivalReponsitory);

  Future<Either<Failure,NumberTrival>> excute({ required int number}) async {
    return await numberTrivalReponsitory.getNumberTrival(number);
  }
}