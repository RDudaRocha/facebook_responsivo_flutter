import 'package:facebook_interface/telas/principal.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:facebook_interface/telas/home.dart';

void main() {
  runApp( MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffold,
    ),
    //home: Home(),
    home: Principal(),
  ));
}
