import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';


void main() {
  runApp(Guesser());
}

void _guess() {
  setState(() {
    Random random = new Random();
    int randomNumber = random.nextInt(99) + 1;
    //Numbers from 1-100
    var number = randomNumber ;
  });
}
class Guesser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}


class HomePageState extends State<HomePage> {
  String text = '';
  String error = '';
  bool display = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('What is my number?' )
      ),
      body:
      Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (String value){
                  setState(() {
                    //Creating a random number
                    var guess = int.parse(value);
                  });
                },
                decoration: InputDecoration(
                    labelText: "Enter your guess",
                    hintText: "Number"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              //Text(text),

              RaisedButton(
                onPressed: (){
                  setState(() {

                    if (guess > number){
                      text = 'number too big';
                    }
                    else if (guess < number){
                      text = 'number too small';
                    }
                    else if (guess == number){
                      text = 'you guessed it!!!';
                    }
                  });
                },
                child: Text('Try!'),
              ),
              display ? Text(text) : Spacer()
            ],
          )),
    );
  }
}