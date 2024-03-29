import 'package:flutter/material.dart';
import 'package:riot_client_flutter/widgets/side_area.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SideArea(versionString: "v53.0.0"),
        Expanded(
          child: Image.asset(
            'images/background.jpg',
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
            filterQuality: FilterQuality.high,
          ),
        )
      ],
    );
  }
}
