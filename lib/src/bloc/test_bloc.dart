import 'dart:async';
import 'package:homehealth/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterTestBloc with Validators {
  final _typeTest = BehaviorSubject<String>();
  final _answerTest = BehaviorSubject<String>();

  Stream<String> get typeTestStream => _typeTest.stream.transform(validateName);
  Stream<String> get answerStream =>
      _answerTest.stream.transform(validateLastname);

  Function(String) get changeTypeTest => _typeTest.sink.add;
  Function(String) get changeAnswer => _answerTest.sink.add;

  /*  Stream<bool> get formValidStream => Rx.combineLatest7(
        nameStream,
        lastNameStream,
        phoneStream,
        documentNumberStream,
        birthdateStream,
        addressStream,
        userID,
        (a, b, c, d, e, f, g) => true,
      ); */

  String get typeTest => _typeTest.value;
  String get answer => _answerTest.value;

  dispose() {
    _typeTest.close();
    _answerTest.close();
  }
}
