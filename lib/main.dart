import 'package:flutter/material.dart';

import 'mydragable.dart';
enum _OnTapWinner { none, yellow, green } //nested onTap
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Mydrag(title: 'Flutter Demo Home Page'),

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
  //nestedonTap
  bool _isYellowTranslucent = false;
  _OnTapWinner _winner = _OnTapWinner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 5);

//  Color _color = Colors.white; onTap


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('Green onTap');
              setState(() {
                _winner = _OnTapWinner.green;
              });
            },
            onTapDown: (_) => debugPrint('Green onTapDown'),
            onTapCancel: () => debugPrint('Green onTapCancel'),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: _winner == _OnTapWinner.green ? highlightBorder : null,
                color: Colors.green,
              ),
              child: GestureDetector(
                // Setting behavior to transparent or opaque as no impact on
                // parent-child hit testing. A tap on 'Yellow' is also in
                // 'Green' bounds. Both enter the gesture arena, 'Yellow' wins
                // because it is in front.
                behavior: _isYellowTranslucent
                    ? HitTestBehavior.translucent
                    : HitTestBehavior.opaque,
                onTap: () {
                  debugPrint('Yellow onTap');
                  setState(() {
                    _winner = _OnTapWinner.yellow;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                    _winner == _OnTapWinner.yellow ? highlightBorder : null,
                    color: Colors.amber,
                  ),
                  width: 200,
                  height: 200,
                  child: Text(
                    'HitTextBehavior.${_isYellowTranslucent ? 'translucent' : 'opaque'}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () {
                  setState(() {
                    _isYellowTranslucent = false;
                    _winner = _OnTapWinner.none;
                  });
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: Text(
                  'Set Yellow behavior to ${_isYellowTranslucent ? 'opaque' : 'translucent'}',
                ),
                onPressed: () {
                  setState(() => _isYellowTranslucent = !_isYellowTranslucent);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }






// return Container(
    //   color: _color,
    //   height: 200.0,
    //   width: 200.0,
    //   child: GestureDetector(
    //     onTap: () {
    //       setState(() {
    //         _color == Colors.lime[300]
    //             ? _color = Colors.white
    //             : _color = Colors.yellow;
    //       });
    //     },
    //
    //      // This trailing comma makes auto-formatting nicer for build methods.
    //   ),
    // );
  }

