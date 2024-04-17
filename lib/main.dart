import 'package:flutter/material.dart';

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
      body:Center(
        child: Row(
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

          ],
        ),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
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
