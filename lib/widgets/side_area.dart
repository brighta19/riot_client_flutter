import 'package:flutter/material.dart';
import 'package:riot_client_flutter/widgets/provider_button.dart';

class SideArea extends StatelessWidget {
  const SideArea({Key? key, required this.versionString}) : super(key: key);

  final String versionString;

  @override
  Widget build(BuildContext context) {
    var buttonBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Expanded(
          child: ProviderButton(
            iconName: "images/facebook_icon.png",
            color: Color(0xff1877f2),
            borderColor: Color(0xff1771e6),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: ProviderButton(
            iconName: "images/google_icon.png",
            color: Color(0xffffffff),
            borderColor: Color(0xfff2f2f2),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: ProviderButton(
            iconName: "images/apple_icon.png",
            color: Color(0xff000000),
            borderColor: Color(0xff000000),
          ),
        ),
      ],
    );

    var signInForm = Column(
      children: [
        // Sign In Text
        Container(
          padding: const EdgeInsets.only(
            top: 67,
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: Color(0xff111111),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Username Input Box
        Container(
          padding: const EdgeInsets.only(
            top: 26,
          ),
          child: const InputBox(),
        ),
        // Password Input Box
        Container(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: const InputBox(),
        ),
        // Third Party Login Buttons
        Container(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: buttonBar,
          ),
        ),
        // Remember Me Checkbox
        Container(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset("images/checked_box.png"),
              Container(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: const Text(
                  "Stay signed in",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    var signInHelpTextContainer = Column(
      children: [
        Text(
          "Can't sign in?".toUpperCase(),
          style: const TextStyle(
            color: Color(0xffb2b2b2),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Create Account".toUpperCase(),
          style: const TextStyle(
            color: Color(0xffb2b2b2),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return Container(
      width: 400,
      height: double.infinity,
      color: const Color(0xfff9f9f9),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 56,
              right: 56,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 69,
                  ),
                  child: Image.asset('images/riot_logo.png'),
                ),
                Expanded(
                  child: signInForm,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 62,
                  ),
                  child: Image.asset('images/submit_btn.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: signInHelpTextContainer,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 47,
            right: 47,
            child: Text(
              versionString,
              style: const TextStyle(
                color: Color(0xffc9c9c9),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
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
