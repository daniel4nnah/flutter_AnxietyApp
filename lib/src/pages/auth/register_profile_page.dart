import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/providers/country_provider.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';
import 'package:homehealth/src/utils/utils.dart';
import 'package:homehealth/src/widgets/background.dart';
import 'package:intl/intl.dart';

class RegisterProfilePage extends StatelessWidget {
  final countryProvider = new CountryProvider();
  final _profileModel = new ProfileModel();
  final _usuarioProvider = new UsuarioProvider();
  final TextEditingController _textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = Provider.registerProfile(context);

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: size.width * 0.2,
                margin: EdgeInsets.only(
                    left: size.width * 0.5, bottom: size.height * 0.03),
                child: Image(
                  image: AssetImage('assets/images/teddybear.png'),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Text(
                "Ingrese la siguiente información para completar el registro del perfil de usuario",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                  stream: bloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changeName(value),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person_outline_sharp,
                              color: Colors.black12),
                          hintText: "Nombre",
                          border: InputBorder.none,
                          counterText: snapshot.data,
                          errorText: snapshot.error),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                  stream: bloc.lastNameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changeLastName(value),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_outline_sharp,
                            color: Colors.black12),
                        hintText: "Apellido",
                        border: InputBorder.none,
                        errorText: snapshot.error,
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                  stream: bloc.documentNumberStream,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changeDocumentNumber(value),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.credit_card, color: Colors.black12),
                        hintText: "Número de Identificación",
                        border: InputBorder.none,
                        errorText: snapshot.error,
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                  stream: bloc.phoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changePhone(value),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone, color: Colors.black12),
                        hintText: "Número de Telefono",
                        border: InputBorder.none,
                        errorText: snapshot.error,
                      ),
                    );
                  }),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(29)),
                child: StreamBuilder(
                    stream: bloc.birthdateStream,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (value) => {},
                        controller: _textEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon:
                              Icon(Icons.calendar_today, color: Colors.black12),
                          hintText: "Fecha de Nacimiento",
                          border: InputBorder.none,
                        ),
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _selectDate(context, bloc);
                        },
                      );
                    })),
            SizedBox(height: size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: StreamBuilder(
                  stream: bloc.addressStream,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changeAddress(value),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Icon(
                            //0xe3c9
                            IconData(63477, fontFamily: 'MaterialIcons'),
                            color: Colors.black12),
                        hintText: "Dirección",
                        border: InputBorder.none,
                        errorText: snapshot.error,
                      ),
                    );
                  }),
            ),
            SizedBox(height: size.height * 0.02),
            StreamBuilder(
                stream: bloc.formValidStream,
                builder: (context, snapshot) {
                  return ElevatedButton(
                      onPressed: snapshot.hasData
                          ? () => registerProfileUser(bloc, context)
                          : null,
                      child: Container(
                        child: Text(
                          'Guardar',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 100),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29)),
                          elevation: 0.0,
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white));
                }),
          ],
        )),
      ),
    );
  }

  void _selectDate(BuildContext context, RegisterProfileBloc bloc) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      final formatDate = new DateFormat("dd-MM-yyyy");
      bloc.changeBirthdate(picked.toString());
      _textEditingController.text = formatDate.format(picked);
    }
  }

  registerProfileUser(RegisterProfileBloc bloc, BuildContext context) async {
    _profileModel.firstname = bloc.name;
    _profileModel.lastname = bloc.lastname;
    _profileModel.documentNumber = bloc.documentNumber;
    _profileModel.phone = bloc.phone;
    _profileModel.birthdate = bloc.birthdate;
    _profileModel.address = bloc.address;
    _profileModel.uID = bloc.uID;
    bool next = await _usuarioProvider.registerProfileUser(_profileModel);
    if (next) {
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      mostrarAlerta(context, "No se pudo crear el perfil del usuario");
    }
  }
}
