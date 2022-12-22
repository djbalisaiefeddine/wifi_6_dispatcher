import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wifi 6 Dispatcher',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wifi 6 Dispatcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height+0.5,
                width: MediaQuery.of(context).size.width*0.5,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Text('List 1'),
                    Text('List 2'),
                    Text('List 3'),
                  ],
                ),
              ),
              Container(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height+0.5,
                width: MediaQuery.of(context).size.width*0.5,
              )

            ],
          ),
        )
      ),
    );
  }

  @override
  void initState() {
   test();
  }

  void getavailablewifi(){
    Process.start('cmd', []).then((Process process) {
      process.stdout
          .transform(utf8.decoder)
          .listen((data) { print(data); });
      process.stdin.writeln('netsh wlan show network');
      //process.stdin.writeln('Hello, galaxy!');
      //process.stdin.writeln('Hello, universe!');
    });
  }
  void test(){
    Process.start('C:\\Users\\sst\\Desktop\\dispatcher\\dist\\wifi_scan.exe', [],runInShell: true).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      process.exitCode.then(print);
    });
  }


}
