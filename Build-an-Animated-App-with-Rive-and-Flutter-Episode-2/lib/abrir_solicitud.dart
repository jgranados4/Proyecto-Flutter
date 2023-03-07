import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn_volver.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import './config/config.dart';
import './model/Datos.dart';
import './services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbrirSolicitud extends StatefulWidget {
  const AbrirSolicitud({Key? key}) : super(key: key);

  @override
  State<AbrirSolicitud> createState() => _AbrirSolicitudState();
}

class _AbrirSolicitudState extends State<AbrirSolicitud> {
  late RiveAnimationController _btnVolverAnimationColtroller;
  UserModelA? userModelA;
  GlobalKey<FormState> GlobalFormKey = GlobalKey<FormState>();
  bool isShowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  @override
  void initState() {
    _btnVolverAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
    userModelA = UserModelA();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        userModelA = arguments['model'];
        setState(() {});
      }
    });
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
          Form(
            key: GlobalFormKey,
            child: AnimatedPositioned(
              duration: const Duration(milliseconds: 240),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                        ),
                        child: FormHelper.inputFieldWidget(
                          context,
                          //const Icon(Icons.person),
                          "Bloque",
                          "Bloque",
                          (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return 'Ingrese el Bloque.';
                            }

                            return null;
                          },
                          (onSavedVal) => {
                            userModelA!.bloque = onSavedVal,
                          },
                          initialValue: userModelA!.bloque ?? "",
                          obscureText: false,
                          borderFocusColor: Colors.blue,
                          borderColor: Colors.black,
                          textColor: Colors.black,
                          hintColor: Colors.black.withOpacity(0.7),
                          borderRadius: 10,
                          showPrefixIcon: true,
                          prefixIcon: Icon(Icons.block_sharp),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                        ),
                        child: FormHelper.inputFieldWidget(
                          context,
                          //const Icon(Icons.person),
                          "Aula",
                          "Aula",
                          (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return 'Ingrese el Aula.';
                            }

                            return null;
                          },
                          (onSavedVal) => {
                            userModelA!.aula = onSavedVal,
                          },
                          initialValue: userModelA!.aula ?? "",
                          obscureText: false,
                          borderFocusColor: Colors.blue,
                          borderColor: Colors.black,
                          textColor: Colors.black,
                          hintColor: Colors.black.withOpacity(0.7),
                          borderRadius: 10,
                          showPrefixIcon: true,
                          prefixIcon: Icon(Icons.class_rounded),
                        ),
                      ),
                      Center(
                        child: FormHelper.submitButton(
                          "Save",
                          () {
                            if (validateAndSave()) {
                              print(userModelA!.toJson());

                              setState(() {
                                isShowLoading = true;
                              });

                              APIService.saveUser(userModelA!).then(
                                (response) {
                                  setState(() {
                                    isShowLoading = false;
                                  });

                                  if (response) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/home/abrir_solicitud',
                                      (route) => false,
                                    );
                                  } else {
                                    FormHelper.showSimpleAlertDialog(
                                      context,
                                      Config.appName,
                                      "Error occur",
                                      "OK",
                                      () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }
                                },
                              );
                            }
                          },
                          btnColor: Colors.black,
                          borderColor: Colors.white,
                          txtColor: Colors.white,
                          borderRadius: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isShowLoading
              ? CustomPositioned(
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/check.riv",
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);
                      check = controller.findSMI("Check") as SMITrigger;
                      error = controller.findSMI("Error") as SMITrigger;
                      reset = controller.findSMI("Reset") as SMITrigger;
                    },
                  ),
                )
              : SizedBox(),
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
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = GlobalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        Spacer(),
        SizedBox(
          height: size,
          width: size,
          child: child,
        ),
        Spacer(flex: 2),
      ],
    ));
  }
}
