import 'package:flutter/material.dart';
import 'package:homehealth/src/widgets/background.dart';

class ElegirOpcion extends StatefulWidget {
  @override
  createState() => _ElegirOpcionState();
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
              Text('Gracias por contarnos cómo te sientes hoy.',
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

class _ElegirOpcionState extends State<ElegirOpcion> {
  @override
  Widget build(BuildContext context) {
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
                        const Text(
                          'Lamentamos que tu día no esté yendo tan bien',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Image(
                          image: AssetImage('assets/images/panda.png'),
                          width: 250.0,
                          height: 250.0,
                        ),
                        SizedBox(height: 10),
                        Text("¿Qué te gustaría hacer?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18.0)),
                        SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'contacts2');
                                  showDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) {
                                        return MostrarCuadroTexto_Mal();
                                      });
                                },
                                label: Text('Quisiera llamar a alguien'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: Colors.red,
                                  minimumSize: Size(180.0, 40.0),
                                )),
                            SizedBox(width: 20),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'main-customer');
                                },
                                icon: Icon(
                                  Icons.house_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                label: Text('Llévame al inicio'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: Colors.deepPurple,
                                  minimumSize: Size(180.0, 40.0),
                                )),
                            SizedBox(width: 20),
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
