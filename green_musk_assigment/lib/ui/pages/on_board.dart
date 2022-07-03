import 'package:flutter/material.dart';
import 'package:green_musk_assigment/core/constants/colors.dart';
import 'package:green_musk_assigment/ui/pages/build_profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                index == 2 ? isLastPage = true : isLastPage = false;
              });
            },
            children: [
              onBoardPage1(width, height),
              onBoardPage2(width, height),
              onBoardPage3(width, height),
            ]),
        bottomSheet: Container(
            color: Colors.transparent,
            height: 100,
            child: isLastPage == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: backLink, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 46,
                        width: 150,
                        decoration: const BoxDecoration(),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(backLink),
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Continue as guest',
                              style: TextStyle(
                                color: backLink,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    ),
                  )),
      ),
    );
  }

  Column onBoardPage3(double width, double height) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                child: Container(
              width: width,
              height: height * 0.57,
              child: Padding(
                padding: const EdgeInsets.only(right: 100, top: 10),
                child: Image.asset(
                  "images/background_shape_3.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Positioned(
                top: 60,
                right: 0,
                left: 0,
                child: Image.asset("images/saly15.png")),
            Positioned(
                left: 90,
                top: 190,
                child: Image.asset("images/spec1white.png")),
            Positioned(
                right: 110, top: 100, child: Image.asset("images/spec2.png")),
          ],
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(dotHeight: 7, dotWidth: 10),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: const EdgeInsets.only(right: 130, left: 130),
          child: Center(
            child: Text(
              'Connect together and talk.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100, left: 100, top: 20),
          child: Center(
            child: Text(
              'Choose the mentor that you like and start interacting immediately. Enjoy the journey!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: headOne),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 46,
          width: width * 0.9,
          decoration: const BoxDecoration(),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BuildProfile()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/linkedin_logo.png"),
                ),
                SizedBox(
                  width: 20,
                ),
                const Text(
                  'Get started with LinkedIN',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        )
      ],
    );
  }

  Column onBoardPage2(double width, double height) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                child: Container(
              width: width,
              height: height * 0.57,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "images/background_shape_1.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Positioned(
                top: 60,
                right: 0,
                left: 0,
                child: Image.asset("images/saly14.png")),
            Positioned(
                left: 90, top: 50, child: Image.asset("images/spec2.png")),
            Positioned(
                right: 100,
                top: 150,
                child: Image.asset("images/spec1white.png")),
          ],
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(dotHeight: 7, dotWidth: 10),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 130, left: 130),
          child: Center(
            child: Text(
              'Find your mentor quickly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100, left: 100, top: 20),
          child: Center(
            child: Text(
              'Our smart match technology will match you with a mentor best fit to help you achieve your goals.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: headOne),
            ),
          ),
        )
      ],
    );
  }

  Column onBoardPage1(double width, double height) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                child: Container(
              width: width,
              height: height * 0.57,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Image.asset(
                  "images/background_shape_2.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Center(
              child: Container(
                  height: height * 0.53,
                  child: Image.asset("images/saly13.png")),
            ),
            Positioned(
                left: 90, top: 50, child: Image.asset("images/spec1blue.png")),
            Positioned(
                left: 70, top: 300, child: Image.asset("images/spec2.png")),
          ],
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(dotHeight: 7, dotWidth: 10),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: const EdgeInsets.only(right: 130, left: 130),
          child: Center(
            child: Text(
              'Join MentorGem with one click.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100, left: 100, top: 20),
          child: Center(
            child: Text(
              'Joining MentorGem is easy. Join with Linkedin for the most optimal experience. Other login options are available. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: headOne),
            ),
          ),
        )
      ],
    );
  }
}
