import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:cleancodepart1/features/number_trival/domain/usecases/get_random_number_trival.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_number_trival_test.mocks.dart';
void main() {
  late GetRandomNumberTrival usecase;
  late MockNumberTrivalReponsitory mockNumberTrivalReponsitory;

  setUp(() {
    mockNumberTrivalReponsitory = MockNumberTrivalReponsitory();
    usecase = GetRandomNumberTrival(numberTrivalReponsitory: mockNumberTrivalReponsitory);
  });

  var tNumberTrivia = NumberTrival(text: 'text', number: 1);

  test('should random number', () async {
    
    when(mockNumberTrivalReponsitory.getRandomNumberTrival()).thenAnswer((_) async => Right(tNumberTrivia));

    var result = await usecase(NoParams());

    expect(result, Right(tNumberTrivia));

    verify(mockNumberTrivalReponsitory.getRandomNumberTrival());

    verifyNoMoreInteractions(mockNumberTrivalReponsitory);

  });
}