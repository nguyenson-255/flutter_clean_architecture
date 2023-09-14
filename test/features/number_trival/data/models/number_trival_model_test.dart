import 'package:cleancodepart1/features/number_trival/data/models/number_trival_model.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final tNumberTrivalModel = NumberTrivalModel(number: 1, text: 'test');


  test('numbertrival model test', () {
    expect(tNumberTrivalModel, isA<NumberTrival>());
  });


}