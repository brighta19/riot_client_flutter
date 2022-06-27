import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: "Riot Client",
      color: const Color.fromRGBO(255, 255, 255, 1),
      builder: (BuildContext context, Widget? child) {
        return const HomePage();
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checked = true;

    var buttonBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _createThirdPartyLoginButton(
            "images/facebook_icon.png",
            const Color(0xff1877f2),
            const Color(0xff1771e6),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _createThirdPartyLoginButton(
            "images/google_icon.png",
            const Color(0xffffffff),
            const Color(0xfff2f2f2),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _createThirdPartyLoginButton(
            "images/apple_icon.png",
            const Color(0xff000000),
            const Color(0xff000000),
          ),
        ),
      ],
    );

    var signInForm = Column(
      children: [
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
        Container(
          padding: const EdgeInsets.only(
            top: 26,
          ),
          child: _createInputBox(),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: _createInputBox(),
        ),
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
        Container(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: checked
                    ? Image.asset("images/checked_box.png")
                    : Image.asset("images/unchecked_box.png"),
              ),
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

    var sidebar = Container(
        width: 400,
        height: 864,
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
                    child: Image.asset(
                      'images/riot_logo.png',
                    ),
                  ),
                  Expanded(
                    child: signInForm,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 62,
                    ),
                    child: Image.asset(
                      'images/submit_btn.png',
                    ),
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
            const Positioned(
              bottom: 47,
              right: 47,
              child: Text(
                "V53.0.0",
                style: TextStyle(
                  color: Color(0xffc9c9c9),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));

    return Row(
      children: [
        sidebar,
        Expanded(
          child: Container(
            height: 864,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
              ),
            ),
          ),
        )
      ],
    );
  }

  Container _createInputBox() {
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

  Container _createThirdPartyLoginButton(
    String iconName,
    Color color,
    Color borderColor,
  ) {
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
