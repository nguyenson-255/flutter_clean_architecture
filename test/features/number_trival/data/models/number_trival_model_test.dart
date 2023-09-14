import 'dart:convert';

import 'package:cleancodepart1/features/number_trival/data/models/number_trival_model.dart';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  final tNumberTrivalModel = NumberTrivalModel(number: 1, text: 'test');


  test('numbertrival model test', () async {
    expect(tNumberTrivalModel, isA<NumberTrival>());
  });


  group('fromJson', () {
    test('test when return number trival is int', () {
      Map<String, dynamic> jsonMap = jsonDecode(Fixture('trival.json'));

      final result =  NumberTrivalModel.fromJson(jsonMap);

      expect(result, equals(tNumberTrivalModel));
    });

    test('test return number trival is double', () {
      Map<String, dynamic> jsonMap = jsonDecode(Fixture('trival_double.json'));
      final result = NumberTrivalModel.fromJson(jsonMap);

      expect(result, equals(tNumberTrivalModel));

    });
  });

  test('toJson', () {
    final result = tNumberTrivalModel.toJson();

    final expectMap = {
      "text": "test",
      "number": 1
    };

    expect(result, expectMap);
  });

}