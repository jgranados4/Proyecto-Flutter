import "package:flutter/material.dart";

import 'dart:ui';

import 'package:rive/rive.dart';
import 'package:rive_animation/abrir_solicitud.dart';
import 'package:rive_animation/cerrar_solicitud.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_abrir.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_cerrar.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_close.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_solicitud.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_soporte.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late RiveAnimationController _btnAbrirAnimationColtroller;
  late RiveAnimationController _btnCerrarAnimationColtroller;
  late RiveAnimationController _btnSoporteAnimationColtroller;
  late RiveAnimationController _btnCloseAnimationColtroller;
  late RiveAnimationController _btnSolicitudAnimationColtroller;

  @override
  void initState() {
    _btnAbrirAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _btnCerrarAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _btnSoporteAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _btnCloseAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _btnSolicitudAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 1000,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Column(
                          children: [
                            AnimatedBtnAbrir(
                              btnAnimationColtroller:
                                  _btnAbrirAnimationColtroller,
                              press: () {
                                _btnAbrirAnimationColtroller.isActive = true;
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pushNamed(
                                      context, "/home/abrir_solicitud");
                                });
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                            ),
                            AnimatedBtnCerrar(
                              btnAnimationColtroller:
                                  _btnCerrarAnimationColtroller,
                              press: () {
                                _btnCerrarAnimationColtroller.isActive = true;
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pushNamed(
                                      context, "/home/cerrar_solicitud");
                                });
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                            ),
                            AnimatedBtnSoporte(
                              btnAnimationColtroller:
                                  _btnSoporteAnimationColtroller,
                              press: () {
                                _btnSoporteAnimationColtroller.isActive = true;
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pushNamed(context, "/home/soporte");
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        AnimatedBtnClose(
                          btnAnimationColtroller: _btnCloseAnimationColtroller,
                          press: () {
                            _btnCloseAnimationColtroller.isActive = true;
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        AnimatedBtnSolicitud(
                          btnAnimationColtroller:
                              _btnSolicitudAnimationColtroller,
                          press: () {
                            _btnSolicitudAnimationColtroller.isActive = true;
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushNamed(context, "/home/solicitudes");
                            });
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
