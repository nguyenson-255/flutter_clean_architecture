import 'package:cleancodepart1/core/error/failures.dart';
import 'package:cleancodepart1/core/usecases/Usecase.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:cleancodepart1/features/number_trival/domain/reponsitories/NumberTrivalReponsitory.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetNumberTrival implements UseCase<NumberTrival,Params>{
  final NumberTrivalReponsitory numberTrivalReponsitory;

  GetNumberTrival(this.numberTrivalReponsitory);
  
  @override
  Future<Either<Failure, NumberTrival>> call(Params params) async {
    return await numberTrivalReponsitory.getNumberTrival(params.number);
  }
  
  


}

class Params extends Equatable {
  final int number;
  
  Params({required this.number});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}