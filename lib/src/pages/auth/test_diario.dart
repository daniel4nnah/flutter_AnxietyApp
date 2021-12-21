import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/login_bloc.dart';
import 'package:homehealth/src/bloc/test_bloc.dart';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';
import 'package:homehealth/src/utils/utils.dart';
import 'package:homehealth/src/widgets/background.dart';

class TestDiario extends StatefulWidget {
  @override
  createState() => _TestDiarioState();
}

class MostrarCuadroTexto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey),
      ),
      title: const Text('Hemos registrado tu estado de ánimo',
          textAlign: TextAlign.center),
      content: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
        ),
        child: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Gracias por contarnos cómo te sientes hoy',
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

class MostrarCuadroTexto_Mal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey),
      ),
      title: Column(children: [
        const Text(
          'Todo va a estar bien',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        SizedBox(height: 10),
        Image(
          image: AssetImage('assets/images/friends.png'),
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ]),
      content: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          //borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
        ),
        child: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Estamos cargando tus contactos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\n En unos segundos, podrás llamar a una persona de confianza y se le enviará un mensaje automático de emergencia con tu ubicación.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestDiarioState extends State<TestDiario> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.registerTest(context);
    bloc.changeTypeTest("test-diario");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Image(
                          image:
                              AssetImage('assets/images/whitebearcoffee.png'),
                          width: 250.0,
                          height: 250.0,
                        ),
                        SizedBox(height: 40),
                        Text.rich(TextSpan(
                            text: '¿Cómo va tu día?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25))),
                        Text(
                            "Esto nos ayudará a controlar juntos tu estado de ánimo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18.0)),
                        SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  bloc.changeAnswer("Todo-bien");
                                  _registerTest(bloc, context);
                                  Navigator.pushNamed(context, 'main-customer');
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) {
                                        return MostrarCuadroTexto();
                                      });
                                },
                                label: Text('¡Todo bien!'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: Colors.deepPurple,
                                  minimumSize: Size(180.0, 40.0),
                                )),
                            SizedBox(width: 20),
                            ElevatedButton.icon(
                                onPressed: () {
                                  bloc.changeAnswer("normal");
                                  _registerTest(bloc, context);
                                  Navigator.pushNamed(context, 'opciones');
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) {
                                        return MostrarCuadroTexto();
                                      });
                                },
                                icon: Icon(
                                  Icons.theater_comedy,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                label: Text('Mas o menos'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: Colors.deepPurple,
                                  minimumSize: Size(180.0, 40.0),
                                )),
                            SizedBox(width: 20),
                            ElevatedButton.icon(
                                onPressed: () {
                                  bloc.changeAnswer("mal");
                                  _registerTest(bloc, context);
                                  Navigator.pushNamed(context, 'contacts2');
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) {
                                        return MostrarCuadroTexto_Mal();
                                      });
                                },
                                icon: Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                label: Text('Mal'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: Colors.deepPurple,
                                  minimumSize: Size(180.0, 40.0),
                                ))
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
        ));
  }

  _registerTest(RegisterTestBloc bloc, BuildContext context) async {
    final UsuarioProvider usuarioProvider = new UsuarioProvider();
    final _profileModel = Provider.registerProfile(context);
    ;
    bool info = await usuarioProvider.sendAnswer(
        bloc.typeTest, bloc.answer, _profileModel);
    if (info == true) {
      // blocPR.changeUid(info['Uid']); agrega el valor de UID par e lgeneral.

    } else {
      mostrarAlerta(context, "a ocurrido un error no se registro la respuesta");
    }
  }
}
