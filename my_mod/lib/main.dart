import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/util/constants.dart';
import 'package:xterm/xterm.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class FakeTerminalBackend extends TerminalBackend {
  final _exitCodeCompleter = Completer<int>();
  final _outStream = StreamController<String>();

  @override
  void ackProcessed() {
    // TODO: implement ackProcessed
  }

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  void init() {
    _outStream.sink.add('xterm.dart demo');
    _outStream.sink.add('\r\n');
    _outStream.sink.add('\$ ');
  }

  @override
  Stream<String> get out => _outStream.stream;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    // TODO: implement resize
  }

  @override
  void terminate() {
    // TODO: implement terminate
  }

  @override
  void write(String input) {
    _outStream.sink.add(input);
  }
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final terminal = Terminal(
      backend: FakeTerminalBackend(),
      maxLines: 100,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: TerminalView(
          inputType: TextInputType.number,
          terminal: terminal,
        ),
      ),
    );
  }
}
