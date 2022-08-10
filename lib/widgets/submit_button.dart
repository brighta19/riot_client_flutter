import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.enabled}) : super(key: key);

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: enabled
          ? Image.asset('images/submit_btn.png')
          : Image.asset('images/submit_btn_disabled.png'),
      onPressed: () {},
    );
  }
}
