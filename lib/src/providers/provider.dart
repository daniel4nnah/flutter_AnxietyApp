import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/login_bloc.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/bloc/test_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  final registerProfileBloc = RegisterProfileBloc();

  static RegisterProfileBloc registerProfile(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        .registerProfileBloc;
  }

  final registerTestBloc = RegisterTestBloc();

  static RegisterTestBloc registerTest(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        .registerTestBloc;
  }
}
