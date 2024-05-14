import 'package:modern_onboarding_view/const/app_pics.dart';

class Cars {
  final String? image;

  Cars({
    this.image = AppPics.CAR_01,
  });
}

List<Cars> carsSlideList = [
  //1
  Cars(
    image: AppPics.CAR_01,
  ),
  //2
  Cars(
    image: AppPics.CAR_02,
  ),

  //3
  Cars(
    image: AppPics.CAR_03,
  ),

  //4
  Cars(
    image: AppPics.CAR_04,
  ),

  //5
  Cars(
    image: AppPics.CAR_05,
  ),
];
