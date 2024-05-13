import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modern_onboarding_view/const/app_pics.dart';
import 'package:modern_onboarding_view/model/cars.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

  // int pageTracker = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   pgController.addListener(
  //     () {

  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    pgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pgController,
        itemCount: carsSlideList.length,
        itemBuilder: (context, index) {
          Cars pgSlide = carsSlideList[index];
          return Column(
            children: [
              Text(pgSlide.title!),
              const SizedBox(
                height: 10,
              ),
              SizedBox(height: 400, child: Image.asset(pgSlide.image!)),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

// class SlidePages extends StatelessWidget {
//   const SlidePages({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PageView();
//   }
// }