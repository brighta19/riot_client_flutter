import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

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
