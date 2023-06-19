import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/yellow_button.dart';
const textColor =[
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];
const textStyle = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    fontFamily: "Acme");

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/inapp/bgimage.jpg"))),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText("WELCOME",
                      textStyle: textStyle,
                      colors:textColor ),
                  ColorizeAnimatedText("DUCK STORE",
                      textStyle: textStyle,
                      colors: textColor),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage(
                    "images/inapp/logo.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style:const TextStyle(
                    color: Colors.lightBlueAccent,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Acme"),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('Duck Store'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Supplier only",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                                color: Colors.yellowAccent),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedLogo(controller: _controller),
                              YellowButton(
                                  label: "Log In", onPressed: () {
                                   Navigator.pushReplacementNamed(context, "/supplier_home");
                              }, width: 0.25),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: YellowButton(
                                    label: "Sign Up",
                                    onPressed: () {},
                                    width: 0.25),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: YellowButton(
                                label: "Log In", onPressed: () {
                              Navigator.pushReplacementNamed(context, "/customer_home");
                            }, width: 0.25),
                          ),
                          YellowButton(
                              label: "Sign Up", onPressed: () {
                            Navigator.pushReplacementNamed(context, "/customer_signup");
                          }, width: 0.25),
                          AnimatedLogo(controller: _controller)
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  decoration:  BoxDecoration(color: Colors.white38.withOpacity(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogIn(
                          label: "Google",
                          child: const Image(
                            image: AssetImage(
                              "images/inapp/google.jpg",
                            ),
                          ),
                          onPressed: () {}),
                      GoogleFacebookLogIn(
                          label: "Facebook",
                          child: const Image(
                            image: AssetImage(
                              "images/inapp/facebook.jpg",
                            ),
                          ),
                          onPressed: () {}),
                      GoogleFacebookLogIn(
                          label: "Guest",
                          child: const Icon(
                            Icons.person,
                            size: 55,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () async{
                            await FirebaseAuth.instance.signInAnonymously();
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        animation: _controller.view,
        child: const Image(
          image: AssetImage("images/inapp/logo.jpg"),
          fit: BoxFit.cover,
        ));
  }
}

class GoogleFacebookLogIn extends StatelessWidget {
  final String label;
  final Widget child;
  final Function() onPressed;

  const GoogleFacebookLogIn({
    super.key,
    required this.label,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
