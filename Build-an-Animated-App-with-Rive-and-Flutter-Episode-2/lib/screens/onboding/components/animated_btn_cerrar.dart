import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class AnimatedBtnCerrar extends StatelessWidget {
  const AnimatedBtnCerrar({
    Key? key,
    required RiveAnimationController btnAnimationColtroller,
    required this.press,
  })  : _btnCerrarAnimationColtroller = btnAnimationColtroller,
        super(key: key);

  final RiveAnimationController _btnCerrarAnimationColtroller;
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
              controllers: [_btnCerrarAnimationColtroller],
            ),
            Positioned.fill(
              // But it's not center
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.doc_fill),
                  SizedBox(width: 8),
                  Text(
                    "Cerrar",
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
