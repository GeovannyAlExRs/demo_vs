import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool _enableCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }
  
  Widget _createSlider() {
    return Slider(
      activeColor: Colors.amber[400],
      label: 'Size Image',
      //divisions: 20,
      value: _valueSlider, 
      min: 10.0, 
      max: 400.0, 
      onChanged: (_enableCheck)?null : (values) {
        setState(() => _valueSlider = values);
        print(values);
      });
  }
  
  Widget _createImage() {
    String url = 'https://static.wikia.nocookie.net/spiderman/images/2/2c/Spider-Man_3_Poster.png/revision/latest?cb=20200612203333&path-prefix=es';
    return Image(
      image: NetworkImage(url),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
  
  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _enableCheck, 
      onChanged: (values) {
        setState(() => _enableCheck = values!);
      });
  }
  
  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Switch'),
      value: _enableCheck, 
      onChanged: (values) {
        setState(() => _enableCheck = values!);
      });
  }
  
}