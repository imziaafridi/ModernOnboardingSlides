// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modern_onboarding_view/model/cars.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyOnboardingApp());
}

class MyOnboardingApp extends StatelessWidget {
  const MyOnboardingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' M O D E R N - O N B O A R D I N G - V I E W ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // fontFamily: 'assets/Roboto',
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontFamily: 'assets/Roboto',
            decoration: TextDecoration.underline,
            decorationColor: Colors.deepOrange,
            decorationStyle: TextDecorationStyle.dotted,
            decorationThickness: 1.0,
          ),
        ),
      ),
      home: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pgController = PageController();
  var cars = carsSlideList;
  // int _currentPgIndex = 1;

  double pageTracker = 0.0;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    pgController.addListener(
      () {
        var halfTracker = 100 / cars.length;
        pageTracker = halfTracker;

        currentPage = pgController.page ?? 0;
        setState(() {
          pageTracker = (1 + currentPage) * halfTracker;
        });
      },
    );
    debugPrint('initState()');
  }

  @override
  void dispose() {
    super.dispose();
    pgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build()');
    final Size _sizeMQ = MediaQuery.of(context).size;
    debugPrint('traker: $pageTracker');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children: [
              //pages slider

              PageView.builder(
                controller: pgController,
                itemCount: carsSlideList.length,
                itemBuilder: (context, index) {
                  Cars pgSlide = carsSlideList[index];
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      pgSlide.image!,
                      // fit: BoxFit.cover,
                      height: _sizeMQ.height / 2.0,
                    ),
                  );
                },
              ),

              // inidators -> pages
              Positioned(
                bottom: _sizeMQ.height / 100.0,
                left: _sizeMQ.width / 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: pgController,
                      count: carsSlideList.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.orange,
                        dotColor: Colors.amber.shade200,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        debugPrint('text btn is pressed !');
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),

              // Circular progrss -> pages
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: _sizeMQ.height / 14.2,
                    right: _sizeMQ.width / 14.2,
                    width: _sizeMQ.width / 14.5,
                    // height: _sizeMQ.height / 20,
                    child: CustomPaint(
                      painter: ProgressTracker(progressTraker: pageTracker),
                    ),
                  ),
                  Positioned(
                    bottom: _sizeMQ.height / 19.5,
                    right: _sizeMQ.width / 25.5,
                    width: _sizeMQ.width / 14.5,
                    // height: 40,
                    child: GestureDetector(
                      onTap: () {
                        // forward pages

                        if (currentPage < carsSlideList.length - 1) {
                          pgController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        } else {
                          // backward pages
                          pgController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      child: Icon(
                        currentPage <= carsSlideList.length - 1
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        size: _sizeMQ.aspectRatio + 32,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressTracker extends CustomPainter {
  ProgressTracker({required this.progressTraker});
  double progressTraker;
  @override
  void paint(Canvas canvas, Size size) {
    // arc 1 paint
    var p2 = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3.8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var p1 = Paint()
      ..color = Colors.amber.shade200
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;
    var center = Offset(size.width, size.height);

    // arc 2 paint

    // arc cicle for 1
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width),
      -pi / 2,
      2 * pi,
      false,
      p1,
    );
    // arc cicle for 2

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width),
      -pi / 2,
      progressTraker * 2 * pi / 100,
      false,
      p2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// i need to push to main branch....
//