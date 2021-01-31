import 'package:flutter/material.dart';
import 'package:simple_app_realtime/counter.dart';
import 'package:simple_app_realtime/numbers_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 0;

  Future<void> _randomizeCounter() async {
    final NumbersService service = NumbersService.filled();
    final int newValue = await service.getRandomInt();
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Random value is:'),
            Counter(_value),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomizeCounter,
        tooltip: 'Randomize',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
