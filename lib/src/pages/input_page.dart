import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '', _email = '', _pass = '', _date = '';
  TextEditingController _inputEditDate = new TextEditingController();
  List<String> _roles = ['Administrador', 'Usuario', 'Asistente'];
  String _selectOption = 'Administrador';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs Text'),),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),children: <Widget>[
        _createInput(),
        Divider(),
        _createEmail(),
        Divider(),
        _createPassword(),
        Divider(),
        _createDate(context),
        Divider(),
        _createDropdown(),
        Divider(),
        _createUser(),
      ],),
    );
  }
  
  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences, 
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('${ 30 - _name.length }'),
        hintText: 'Name User',
        labelText: 'Name',
        helperText: 'Solo 30 caracteres',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() => _name = valor);
      },);
  }
  
  Widget _createUser() {
    return ListTile(
      title: Text('Usuario: $_name'), 
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectOption),);
  }
  
  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('${ 20 - _email.length }'),
        hintText: 'example@dtk.com',
        labelText: 'Email',
        helperText: 'Solo 20 carateres',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() => _email = valor),);
  }
  
  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('${ 15 - _pass.length }'),
        hintText: '◉◉◉◉◉◉◉',
        labelText: 'Password',
        helperText: 'Solo 15 carateres',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() => _pass = valor),);
  }
  
  _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputEditDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('${ 15 - _name.length }'),
        hintText: 'dd/MM/aaaa',
        labelText: 'Fecha Nac.',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today )),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }
  
  _selectDate(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es'),
    );

    if (dateTime != null) {
      setState(() { 
        _date = dateTime.toString(); 
        _inputEditDate.text = _date;
      });
    }
  }
  
  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all_rounded),
        SizedBox(width: 25.0,),
        DropdownButton(
          items: getOptionDropdown(), 
          hint: Text('Seleccionar...'),
          
          onChanged: (op) {
            print(op);
            setState(() => _selectOption = op?? "");
          },

          value: _selectOption,
        ),
      ],
    );
  } 

  List<DropdownMenuItem<String>> getOptionDropdown() {
    return _roles.map<DropdownMenuItem<String>>(
      (op) => DropdownMenuItem(child: Text(op), value: op,)).toList();
  }
}