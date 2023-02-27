import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class AnimatedBtnSolicitud extends StatelessWidget {
  const AnimatedBtnSolicitud({
    Key? key,
    required RiveAnimationController btnAnimationColtroller,
    required this.press,
  })  : _btnSolicitudAnimationColtroller = btnAnimationColtroller,
        super(key: key);

  final RiveAnimationController _btnSolicitudAnimationColtroller;
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
              controllers: [_btnSolicitudAnimationColtroller],
            ),
            Positioned.fill(
              // But it's not center
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.doc_on_doc_fill),
                  SizedBox(width: 8),
                  Text(
                    "Ver Solicitudes",
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
