import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
    return  HomePageState();
    }
  }
class HomePageState extends State<HomePage> {
  String text = '';
  String error = '';
  bool display = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color(0xff885566),
            title: const Text('Euro To Lei Converter')
         ),
        body:
        Container(
            padding: const EdgeInsets.all(40.0),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3n5hwe9Gf_UhHN9O6zPdOt9SRiFd7aP0FUg&usqp=CAU'
                ),
                TextField(
                  onChanged: (String value){
                    setState(() {
                      var ron = int.parse(value);
                      var euro = ron*4.5;
                      text = euro.toString();

                    });
                  },
                  decoration: InputDecoration(
                      labelText: "Enter the amount you want to convert",
                      hintText: "Amount in RON"
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
                      display = !display;
                    });
                  },
                  child: Text('CONVERT'),
              ),
                display ? Text(text) : Spacer()
            ],
          )),
    );
  }
}
