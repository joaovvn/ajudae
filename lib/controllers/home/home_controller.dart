import 'package:ajudae/constants/images.dart';
import 'package:ajudae/models/city.dart';
import 'package:ajudae/models/claim.dart';
import 'package:ajudae/models/news.dart';
import 'package:ajudae/models/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<City> cityList =
      [City(1, "Aracaju", "SE"), City(2, "Estância", "SE")].obs;
  RxList<News> newsList = [
    News("Notícia 1", AppImages.newsImage, ""),
    News("Notícia 2", AppImages.newsImage, ""),
    News("Notícia 3", AppImages.newsImage, "")
  ].obs;
  RxList<News> highlightsList = [
    News("Aracaju 100% no LED", AppImages.highlight,
        "Prefeitura substitui 100% dos postes de iluminação pública para lâmpadas em LED."),
  ].obs;
  RxList<Claim> followingClaimList = List<Claim>.empty(growable: true).obs;
  late Rx<City> selectedCity;
  late Rx<User> user;

  init() {
    selectedCity = cityList.first.obs;
    user = User("Roberto Pedral", AppImages.profileImage).obs;
    followingClaimList.add(Claim(user.value, 1, "Rua Maria José - 123", 1));
    followingClaimList.add(Claim(user.value, 1, "Rua Maria José - 123", 1));
    followingClaimList.add(Claim(user.value, 1, "Rua Maria José - 123", 2));
  }
}
