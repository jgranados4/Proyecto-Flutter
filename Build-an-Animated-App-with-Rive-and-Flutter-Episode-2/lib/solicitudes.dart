import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:ui';

import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_volver.dart';

class Solicitudes extends StatefulWidget {
  const Solicitudes({super.key});

  @override
  State<Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  late RiveAnimationController _btnVolverAnimationColtroller;

  @override
  void initState() {
    _btnVolverAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Solicitudes"),
      ),
      body: listApp(),
      /*Stack(children: [
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
                    child: Column(children: [
                      const Spacer(),
                      SizedBox(
                        width: 260,
                      ),
                      listApp(),
                      Row(
                        children: [
                          AnimatedBtnVolver(
                            btnAnimationColtroller:
                                _btnVolverAnimationColtroller,
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
                    ]))))
      ])*/
    );
  }

  Widget listApp() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        
      },
    );
  }
}
