import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({ Key? key, required this.result, required this.age, required this.isMale }) : super(key: key);

  final double result;
  final int age;
  final bool isMale;

  String get resultPhrase{
    String resultText ="";
     if(result >= 30) {
      resultText ='Obese';
    } else if(result  > 25 && result <30) {
      resultText ='Overwight';
    } else if(result >18.5 && result <= 24.9 ) {
      resultText ='Normal';
    } else {
      resultText ='Thin';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       title: const Text('Result'),
    ),
    body: SafeArea(
      child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text('Gander : ${isMale?'male' : 'femal'}',
      style:Theme.of(context).textTheme.headline1,
      textAlign: TextAlign.center,
      ),
      Text('Result : ${result.toStringAsFixed(1)}',
      style:Theme.of(context).textTheme.headline1 ,
      textAlign: TextAlign.center,
      ),
      Text('Healthiness : $resultPhrase ',
      style:Theme.of(context).textTheme.headline1 ,
      textAlign: TextAlign.center,
      ),
      Text('Age : $age',
      style:Theme.of(context).textTheme.headline1 ,
      textAlign: TextAlign.center,
      ),
    ])
    
    ,)),
    );
  }
}