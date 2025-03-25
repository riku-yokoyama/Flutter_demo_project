import 'package:flutter/material.dart';

void main() {
  // Flutterアプリのエントリー(定型文)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // アプリのルートになるウィジェット(これも定型)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Dartでは文字列は連結ではなく、変数の埋め込み($を使用)
      // ダブルクォーテーションかシングルクォーテーションかは自由
      print("現在のカウンタの数は$_counterです");
      _counter++;
      print("次のカウンタの数は$_counterです");
    });
  }

  void resetToZero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this._counter % 4 == 0?  Colors.blueGrey : Colors.lime,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HelloWidget2(counter: _counter),
            test01(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // インクリメントボタン
          FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
          ),
          SizedBox(width: 20),
          // リセットボタン
          FloatingActionButton(
              onPressed: resetToZero,
              child: Text("reset"),
          )
        ],
      )
    );
  }
}

class test01 extends StatelessWidget {
  const test01({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("これはテストです");
  }
}


class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("こんにちは");
  }
}

class HelloWidget2 extends StatefulWidget {
  HelloWidget2({super.key, required this.counter});

  int counter;

  @override
  State<HelloWidget2> createState() => _HelloWidget2State();
}

class _HelloWidget2State extends State<HelloWidget2> {
  @override
  Widget build(BuildContext context) {
    return widget.counter % 2 == 0 ?
    const Text("おはよう") : const Text("こんばんは");
  }
}
