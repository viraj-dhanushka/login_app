import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/welcome/home.dart';
import '../../../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0.0 : -30.0,
              left: animate ? 0.0 : -10.0,
              child: SvgPicture.asset(
                splashIcon,
                semanticsLabel: splashTextOne,
                height: splashIconLargeHeight,
                width: splashIconLargeWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      splashTextOne,
                      textStyle: TextStyle(fontSize: 40.0),
                      colors: splashColorizeColors,
                      speed: const Duration(milliseconds: 3000),
                    ),
                  ],
                  // isRepeatingAnimation: true,
                  // pause: const Duration(milliseconds: 2000),
                  displayFullTextOnTap: false,
                  stopPauseOnTap: false,
                ),
                // Text(splashTextOne,
                //     style: Theme.of(context).textTheme.headlineLarge),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: animate ? 1 : 0,
                  child: Text(splashTextTwo,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(height: 50.0),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: animate ? 1 : 0,
                  child: Center(
                    child: SvgPicture.asset(
                      isDarkMode? splashImageDark : splashImageLight,
                      semanticsLabel: splashTextTwo,
                      height: splashImageHeight,
                      width: splashImageWidth,
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: animate ? 0.0 : -30.0,
              right: animate ? 0.0 : -10.0,
              child: SvgPicture.asset(
                splashIcon,
                semanticsLabel: splashTextOne,
                height: splashIconSmallHeight,
                width: splashIconSmallWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 8000));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: "My Login App")));
  }
}
