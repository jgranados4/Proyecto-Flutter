import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class AnimatedBtnCerrarSolicitud extends StatelessWidget {
  const AnimatedBtnCerrarSolicitud({
    Key? key,
    required RiveAnimationController btnAnimationColtroller,
    required this.press,
  })  : _btnCerrarSolicitudAnimationColtroller = btnAnimationColtroller,
        super(key: key);

  final RiveAnimationController _btnCerrarSolicitudAnimationColtroller;
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
              controllers: [_btnCerrarSolicitudAnimationColtroller],
            ),
            Positioned.fill(
              // But it's not center
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 8),
                  Text(
                    "Cerrar Solicitud",
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
