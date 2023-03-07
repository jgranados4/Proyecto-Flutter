import "package:flutter/material.dart";

import 'dart:ui';

import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_cerrar_solicitud.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_volver.dart';

class CerrarSolicitud extends StatefulWidget {
  const CerrarSolicitud({super.key});

  @override
  State<CerrarSolicitud> createState() => _CerrarSolicitudState();
}

class _CerrarSolicitudState extends State<CerrarSolicitud> {
  late RiveAnimationController _btnVolverAnimationColtroller;
  late RiveAnimationController _btnCerrarSolicitudAnimationController;

  @override
  void initState() {
    _btnCerrarSolicitudAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _btnVolverAnimationColtroller = OneShotAnimation(
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
                            const Text(
                              "Cerrar Puerta",
                              style: TextStyle(
                                  fontSize: 26, fontFamily: "Poppins"),
                            ),
                            const Text(
                              "Bloque:",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                                onSaved: (bloque) {},
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "Aula:",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                                onSaved: (aula) {},
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                            ),
                            AnimatedBtnCerrarSolicitud(
                              btnAnimationColtroller:
                                  _btnCerrarSolicitudAnimationController,
                              press: () {
                                _btnCerrarSolicitudAnimationController
                                    .isActive = true;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        AnimatedBtnVolver(
                          btnAnimationColtroller: _btnVolverAnimationColtroller,
                          press: () {
                            _btnVolverAnimationColtroller.isActive = true;
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context);
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
