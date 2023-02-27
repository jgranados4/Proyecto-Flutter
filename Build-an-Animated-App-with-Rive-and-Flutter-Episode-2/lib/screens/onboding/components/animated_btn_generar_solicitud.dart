import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class AnimatedBtnGenerarSolicitud extends StatelessWidget {
  const AnimatedBtnGenerarSolicitud({
    Key? key,
    required RiveAnimationController btnAnimationColtroller,
    required this.press,
  })  : _btnGenerarSolicitudAnimationColtroller = btnAnimationColtroller,
        super(key: key);

  final RiveAnimationController _btnGenerarSolicitudAnimationColtroller;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 200,
        child: Stack(
          children: [
            // Just a button no animation
            // Let's fix that
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              // Once we restart the app it shows the animation
              controllers: [_btnGenerarSolicitudAnimationColtroller],
            ),
            Positioned.fill(
              // But it's not center
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 8),
                  Text(
                    "Generar Solicitud",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
