import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homehealth/src/widgets/background.dart';
import 'package:intl/intl.dart';

class ManageActivityPage extends StatefulWidget {

  @override
  _ManageActivityPageState createState() => _ManageActivityPageState();
}

class _ManageActivityPageState extends State<ManageActivityPage> {
  final _textEditingController = new TextEditingController();

  List<String> _skills = ["Lavar","Cocinar","Cantar"];

  String _skillSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Crear Actividad"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Background(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Nombre de la actividad"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Descripción de la actividad"
                ),
                maxLines: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Precio por Hora"
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Horas Estimadas"
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                onChanged: (value) => {},
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today, color: Colors.black12),
                  hintText: "Fecha de Nacimiento",
                  border: InputBorder.none,
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                },
              ),
              DropdownButton(
                value: _skillSelected,
                items: _skills.map((String item){
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item
                  );
                }).toList(),
                onChanged: (value){
                  setState(() {
                    _skillSelected = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );
    if (picked != null) {
      final formatDate = new DateFormat("dd-MM-yyyy");
      _textEditingController.text = formatDate.format(picked);
    }
  }
}