import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'window_buttons.dart' as btn;

class WindowBar extends StatelessWidget {
  const WindowBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: const [
                btn.MinimizeButton(),
                btn.CloseButton(),
              ],
            ),
          ),
          const DragToMoveWindow(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

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
        windowManager.startDragging();
      },
      child: child,
    );
  }
}
