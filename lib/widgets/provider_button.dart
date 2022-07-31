import 'package:flutter/material.dart';

class ProviderButton extends StatelessWidget {
  const ProviderButton({
    Key? key,
    required this.iconName,
    required this.color,
    required this.borderColor,
  }) : super(key: key);

  final String iconName;
  final Color color;
  final Color borderColor;

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
