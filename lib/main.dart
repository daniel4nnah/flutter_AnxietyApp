import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/pages/activities/test_state.dart';
import 'package:homehealth/src/pages/auth/appcontacts.dart';
import 'package:homehealth/src/pages/auth/audioplayer.dart';
import 'package:homehealth/src/pages/auth/edit_profile_page.dart';
import 'package:homehealth/src/pages/auth/elegiropcion.dart';
import 'package:homehealth/src/pages/auth/test_diario.dart';
import 'package:homehealth/src/pages/contacts.dart';
import 'package:homehealth/src/pages/customer/main_customer_page.dart';
import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/auth/login_page.dart';
import 'package:homehealth/src/pages/auth/register_page.dart';
import 'package:homehealth/src/pages/auth/register_profile_page.dart';
import 'package:homehealth/src/pages/main_page.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        theme: ThemeData(
            primaryColor: primaryColor, scaffoldBackgroundColor: Colors.white),
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegisterPage(),
          'register-profile': (BuildContext context) => RegisterProfilePage(),
          'edit-profile': (BuildContext context) => EditProfilePage(),
          'main-customer': (BuildContext context) => MainPage(),
          'contacts': (BuildContext context) => ContactsPage(),
          'contacts2': (BuildContext context) => MyAppContacts(),
          'test-generico': (BuildContext context) => TestGeneric(),
          'audio': (BuildContext context) => AudioPlayerHH(),
          'testdiario': (BuildContext context) => TestDiario(),
          'opciones': (BuildContext context) => ElegirOpcion()
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
      ),
    );
  }
}
