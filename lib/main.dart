import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:
        GridView.count(
          padding: EdgeInsets.all(24.0),
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          crossAxisCount: 3,
          children: [
            // myDecoratedBox(),
            Opacity(
                opacity: 0.2,
                child: myDecoratedBox(greeting: 'さようなら')
            ),
            ClipOval(
                child: Image.asset(
                    'images/animal5.png',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover
                )
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                    'images/animal5.png',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover
                )
            ),
            Transform.rotate(
              angle: pi * 1.5,
              child: Icon(Icons.adb),
            ),
            Transform.scale(
              scale: 3,
              child: Icon(Icons.adb),
            ),
            Transform.translate(
              offset: Offset(50,50),
              child: Icon(Icons.adb),
            ),
            Transform(
              transform: Matrix4.skewX(0.3),
              child: Icon(Icons.adb),
            ),
            Transform(
              transform: Matrix4.identity()
                  ..setEntry(3,2,0.01)
                  ..rotateX(0.6),
              child: Icon(
                Icons.adb,
                size: 200,
              )
            ),
            FloatingActionButton(
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    }),
                  );
                },
              child: Text('2nd page')

            )

          ],
        )
      );
       // This trailing comma makes auto-formatting nicer for build methods.
  }
}

Widget myDecoratedBox({ String greeting = 'こんにちは'}) {
  return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        // edge…端っこ、角　Insets…「入れ込む」「差し込む」Inserts
        child: Text(greeting),
      )
  );
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: Scaffold(
            appBar: AppBar(title: const Text('The Matrix 3D')),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Transformサンプル'),
                ],
              )
            )
          )
        )
    );
  }
}



