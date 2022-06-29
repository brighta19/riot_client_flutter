import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// The package "window_manager" has a DragToMoveArea Widget that drags, but
// also maximizes/unmaximizes the window. I do not want the latter.
class DragToMoveWindow extends StatelessWidget {
  final Widget child;

  const DragToMoveWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) {
        if (Platform.isWindows) {
          windowManager.startDragging();
        }
      },
      child: child,
    );
  }
}

class ThirdPartyLoginButton extends StatelessWidget {
  final String iconName;
  final Color color;
  final Color borderColor;

  const ThirdPartyLoginButton({
    Key? key,
    required this.iconName,
    required this.color,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Image.asset(
        iconName,
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}
