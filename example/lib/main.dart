// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruler Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ruler Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  // _MyHomePageState2 createState() => _MyHomePageState2();
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RulerPickerController? _rulerPickerController;

  int currentValue = 4000;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  Widget _buildBtn(int value) {
    return InkWell(
      onTap: () {
        _rulerPickerController?.value = value;
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: Colors.blue,
          child: Text(
            value.toString(),
            style: const TextStyle(color: Colors.white),
          )),
    );
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
            Text(
              currentValue.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
            const SizedBox(height: 50),
            RotatedBox(
              quarterTurns: 1,
              child: RulerPicker(
                rulerBackgroundColor: Colors.transparent,
                controller: _rulerPickerController!,
                beginValue: 30,
                endValue: 50000,
                initValue: currentValue,
                scaleLineStyleList: const [
                  ScaleLineStyle(
                      color: Colors.grey, width: 1.5, height: 30, scale: 0),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 25, scale: 5),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 15, scale: -1)
                ],
                // onBuildRulerScalueText: (index, scaleValue) {
                //   return ''.toString();
                // },
                onValueChange: (value) {
                  setState(() {
                    currentValue = value;
                  });
                },
                width: MediaQuery.of(context).size.width,
                height: 80,
                rulerMarginTop: 8,
                // marker: Container(
                //     width: 8,
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Colors.red.withAlpha(100),
                //         borderRadius: BorderRadius.circular(5))),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBtn(30),
                const SizedBox(width: 10),
                _buildBtn(50),
                const SizedBox(width: 10),
                _buildBtn(100),
                const SizedBox(width: 10),
                _buildBtn(40000),
                const SizedBox(width: 10),
                _buildBtn(50000),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
