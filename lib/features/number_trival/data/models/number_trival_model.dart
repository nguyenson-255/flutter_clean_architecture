import 'dart:convert';
import 'package:cleancodepart1/features/number_trival/domain/entities/NumberTrival.dart';
import 'package:flutter/foundation.dart';

class NumberTrivalModel extends NumberTrival {
  NumberTrivalModel({required super.text, required super.number});


  factory NumberTrivalModel.fromJson(Map<String, dynamic> json) {
    return NumberTrivalModel(text: json['text'], number: (json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "number": number
    };
  }
}