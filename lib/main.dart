import 'dart:ffi';

import 'package:cleancodepart1/loading.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/loading': (context) => Loading(),
      '/home': (context) => NumberTrivalState(),
    },
  ));
}

class NumberTrivalState extends StatefulWidget {
  const NumberTrivalState({super.key});

  @override
  State<NumberTrivalState> createState() => _NumberTrivalStateState();
}

class _NumberTrivalStateState extends State<NumberTrivalState> {
  int _numberTrival = 13;
  String title = '13 is asdkflkajdsfjasdjflasjdf';
  var data;

  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.currentResult;
    
    print(data);
    if (data != null) {
      setState(() {
        _numberTrival = data['_numberTrival'];
        title = data['title'];
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trival'),
        elevation: 1.0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                _numberTrival.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    try {
                      _numberTrival = int.parse(value.trim());
                    } catch (e) {
                      title = e.toString();
                    }
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                    hintText: 'Enter Number Trival'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 170.0,
                      height: 40.0,
                      child: ElevatedButton(
                          onPressed: () async {
                            
                            data = await Navigator.pushNamed(context,'/loading',arguments: {'number': _numberTrival,'type':'N'});
                            if (data != null) {
                              setState(() {
                                _numberTrival = data[1];
                                title = data[0];
                              });
                            }
                            // searchNumber(_numberTrival);
                          },
                          child: Text(
                            'Search',
                          ))),
                  SizedBox(
                      width: 170.0,
                      height: 40.0,
                      child: ElevatedButton(
                          onPressed: () async {
                            data = await Navigator.pushNamed(context,'/loading',arguments: {'type':'R'});
                            if (data != null) {
                              setState(() {
                                _numberTrival = data[1];
                                title = data[0];
                              });
                            }
                            // randomNumber();
                          },
                          child: Text(
                            'Random',
                          ))),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
