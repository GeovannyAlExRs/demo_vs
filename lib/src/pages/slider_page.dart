import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        tite: Text('Slider'),
      );
    );
  }
}