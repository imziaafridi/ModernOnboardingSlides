import 'package:modern_onboarding_view/const/app_pics.dart';

class Cars {
  final String? title;
  final String? description;
  final String? image;

  Cars({
    this.title = 'car',
    this.description = 'this is car 01',
    this.image = AppPics.CAR_01,
  });
}

List<Cars> carsSlideList = [
  //1
  Cars(
    title: 'this is car no. 01',
    image: AppPics.CAR_01,
  ),
  //2
  Cars(
    title: 'this is car no. 01',
    image: AppPics.CAR_02,
  ),

  //3
  Cars(
    title: 'this is car no. 01',
    image: AppPics.CAR_03,
  ),

  //4
  Cars(
    title: 'this is car no. 01',
    image: AppPics.CAR_04,
  ),

  //5
  Cars(
    title: 'this is car no. 01',
    image: AppPics.CAR_05,
  ),
];
