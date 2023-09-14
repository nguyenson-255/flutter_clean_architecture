

import 'package:cleancodepart1/core/error/failures.dart';
import 'package:cleancodepart1/core/usecases/Usecase.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:cleancodepart1/features/number_trival/domain/reponsitories/NumberTrivalReponsitory.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrival implements UseCase<NumberTrival,NoParams>{
  NumberTrivalReponsitory numberTrivalReponsitory;

  GetRandomNumberTrival({required this.numberTrivalReponsitory});

  @override
  Future<Either<Failure, NumberTrival>> call(NoParams params) async {
    return await numberTrivalReponsitory.getRandomNumberTrival();
  }

  
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}