import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String baseUrl = 'http://numbersapi.com';
  var data;

  void searchNumber(number) async {
    final response =
        await get(Uri.parse('$baseUrl/$number'));

    String data = response.body;

    Navigator.pop(context,[data, number]);
  }

  void randomNumber() async {
    final response =
        await get(Uri.parse('$baseUrl/random/trivia'));

    String data = response.body;

    // son nson dep trai
    Navigator.pop(context,[data, int.parse(data.split(' ')[0])]);

  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments;
    
    

  if (data != null) {
    if (data['type'] == 'N') {
      searchNumber(data['number']);
    } else {
      randomNumber();
    }
  }
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            )
      ),
    );
  }
}
