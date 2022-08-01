import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.value,
  }) : super(key: key);

  final bool? value;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    isChecked = widget.value ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          isChecked ? 'images/checked_box.png' : "images/unchecked_box.png",
        ),
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
      ),
    );
  }
}
