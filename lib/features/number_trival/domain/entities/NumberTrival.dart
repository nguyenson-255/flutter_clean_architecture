import 'package:equatable/equatable.dart';
import 'dart:ffi';


class NumberTrival extends Equatable{

  final String text;
  final int number;

  NumberTrival({required this.text, required this.number});
  
  @override
  List<Object?> get props => [text,number];

}