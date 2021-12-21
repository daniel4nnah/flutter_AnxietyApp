import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/bloc/test_bloc.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';
import 'package:homehealth/src/utils/utils.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:convert';

class ProfilePage extends StatelessWidget {
  final _prefs = RegisterProfileBloc();
  @override
  Widget build(BuildContext context) {
    final _profileModel = Provider.registerProfile(context);
    return Expanded(
      child: new charts.LineChart(
        _getSeriesData(_profileModel, context),
        animate: true,
      ),
    );
  }
}

Future<void> _getDaten(RegisterProfileBloc bloc, BuildContext context) async {
  final UsuarioProvider usuarioProvider = new UsuarioProvider();

  Map<String, dynamic> info = await usuarioProvider.getTestAnswer(bloc);
  if (info != null) {
    print(info.length);
  } else {
    mostrarAlerta(context, "la consulta de tu estado tiene problemas");
  }
}

final data = [
  new SalesData(0, 1500000),
  new SalesData(1, 1735000),
  new SalesData(2, 1678000),
  new SalesData(3, 1890000),
  new SalesData(4, 1907000),
  new SalesData(5, 2300000),
  new SalesData(6, 2360000),
  new SalesData(7, 1980000),
  new SalesData(8, 2654000),
  new SalesData(9, 2789070),
  new SalesData(10, 3020000),
  new SalesData(11, 3245900),
  new SalesData(12, 4098500),
  new SalesData(13, 4500000),
  new SalesData(14, 4456500),
  new SalesData(15, 3900500),
  new SalesData(16, 5123400),
  new SalesData(17, 5589000),
  new SalesData(18, 5940000),
  new SalesData(19, 6367000),
];

_getSeriesData(RegisterProfileBloc _prefs, BuildContext context) {
  _getDaten(_prefs, context);
  List<charts.Series<SalesData, int>> series = [
    charts.Series(
        id: "Sales",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.blue.shadeDefault)
  ];
  return series;
}

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}
