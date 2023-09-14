import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:cleancodepart1/features/number_trival/domain/reponsitories/NumberTrivalReponsitory.dart';
import 'package:cleancodepart1/features/number_trival/domain/usecases/get_number_trival.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_number_trival_test.mocks.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTrivalReponsitory {
      
//     }
@GenerateMocks([NumberTrivalReponsitory])
void main() {
  late GetNumberTrival usecase;
  late MockNumberTrivalReponsitory mockNumberTriviaRepository;


  late

  final int tNumber = 1;
  final NumberTrival tNumberTrivia = NumberTrival(number: 1, text: 'test');
  
  setUpAll(() {
    mockNumberTriviaRepository = MockNumberTrivalReponsitory();
    usecase = GetNumberTrival(mockNumberTriviaRepository);
  });

  

  test(
    'should get trivia for the number from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any int argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberTriviaRepository.getNumberTrival(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(number: tNumber));
      // UseCase should simply return whatever was returned from the Repository

      expect(result, Right(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify(mockNumberTriviaRepository.getNumberTrival(tNumber));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );

  
}
