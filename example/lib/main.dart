import 'package:flutter/material.dart';
import 'package:gestu_tweens/gestu_tweens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestu Tweens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Tweens Animations'),
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
  bool _opacityReverse = false;
  bool _scaleReverse = false;
  bool _translateReverse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            OpacityTween(
              delay: const Duration(seconds: 2),
              reverse: _opacityReverse,
              child: const Text('Opacity Tween'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacityReverse = !_opacityReverse;
                });
              },
              child: Text('Reverse OpacityTween: $_opacityReverse'),
            ),
            const Spacer(),
            const Divider(),
            const Spacer(),
            ScaleTween(
              delay: const Duration(seconds: 2),
              reverse: _scaleReverse,
              child: const Text('Scale Tween'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _scaleReverse = !_scaleReverse;
                });
              },
              child: Text('Reverse ScaleTween: $_scaleReverse'),
            ),
            const Spacer(),
            const Divider(),
            const Spacer(),
            TranslateTween(
              delay: const Duration(seconds: 2),
              reverse: _translateReverse,
              child: const Text('Translate Tween'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _translateReverse = !_translateReverse;
                });
              },
              child: Text('Reverse TranslateTween: $_translateReverse'),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
