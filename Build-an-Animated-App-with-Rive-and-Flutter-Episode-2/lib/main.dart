import 'package:flutter/material.dart';
import 'package:rive_animation/abrir_solicitud.dart';
import 'package:rive_animation/cerrar_solicitud.dart';
import 'package:rive_animation/entry_point.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:rive_animation/solicitudes.dart';
import 'package:rive_animation/soporte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => OnboardingScreen(),
        "/home": (context) => EntryPoint(),
        "/home/abrir_solicitud": (context) => AbrirSolicitud(),
        "/home/cerrar_solicitud": (context) => CerrarSolicitud(),
        "/home/soporte": (context) => Soporte(),
        "/home/solicitudes": (context) => Solicitudes(),
      },
      title: 'Control de Solicitudes',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
