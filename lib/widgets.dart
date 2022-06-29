import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

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
        windowManager.startDragging();
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

class WindowButton extends StatefulWidget {
  final Widget onMouseEnterChild;
  final Widget onMouseExitChild;
  final void Function() onTap;

  const WindowButton({
    Key? key,
    required this.onMouseEnterChild,
    required this.onMouseExitChild,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<WindowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEnterEvent details) => setState(() => _hovered = true),
      onExit: (PointerExitEvent details) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: _hovered ? widget.onMouseEnterChild : widget.onMouseExitChild,
      ),
    );
  }
}

class MinimizeButton extends StatelessWidget {
  const MinimizeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowButton(
      onMouseEnterChild: Image.asset(
        'images/hovered_line.png',
      ),
      onMouseExitChild: Image.asset(
        'images/line.png',
      ),
      onTap: () => windowManager.minimize(),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowButton(
      onMouseEnterChild: Image.asset(
        'images/hovered_cross.png',
      ),
      onMouseExitChild: Image.asset(
        'images/cross.png',
      ),
      onTap: () => windowManager.close(),
    );
  }
}
