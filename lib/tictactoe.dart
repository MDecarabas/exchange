import 'package:flutter/material.dart';

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
//

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <Color> color = [Colors.green, Colors.green, Colors.green, Colors.green,
  Colors.green, Colors.green, Colors.green, Colors.green, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Tic-Tac-Toe'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
      ),
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
              onTap: () {
                _tapped(index);
          },
              child: AnimatedContainer(
              color: color[index],
              duration: const Duration(milliseconds: 500),
          ),
          );
        },
      ),
    );
  }
  void _tapped (int index) {
    setState(() {
      if (color[index] == Colors.green) {
        color[index] = Colors.red;
      } else {
        color[index] = Colors.green;
      }
    });

  }
}



