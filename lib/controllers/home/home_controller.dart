import 'package:ajudae/constants/images.dart';
import 'package:ajudae/models/city.dart';
import 'package:ajudae/models/claim.dart';
import 'package:ajudae/models/news.dart';
import 'package:ajudae/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remove_diacritic/remove_diacritic.dart';

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
  TextEditingController locationController = TextEditingController();
  RxList<Claim> locationClaimList = List<Claim>.empty(growable: true).obs;

  init() {
    selectedCity = cityList.first.obs;
    user = User("Roberto Pedral", AppImages.profileImage).obs;
    followingClaimList.clear();
    followingClaimList.add(Claim(
        user.value,
        1,
        "Essa situação tem causado grande transtorno para os moradores, que estão preocupados com a saúde e a higiene do local. É fundamental que a coleta de lixo seja realizada de forma regular e eficiente para evitar esses problemas.",
        "Rua Maria José - 123",
        1,
        AppImages.trash));
    followingClaimList.add(Claim(
        user.value,
        3,
        "A ausência de iluminação adequada aumenta consideravelmente o risco de acidentes e compromete a segurança dos moradores e transeuntes, que ficam mais vulneráveis a assaltos e outras ações criminosas. Além disso, a situação tem gerado desconforto e medo entre os residentes, especialmente aqueles que precisam sair ou chegar em casa após o anoitecer.",
        "Rua Maria José - 123",
        2,
        AppImages.streetLight));
    followingClaimList.add(Claim(
        user.value,
        1,
        "Solicito, com urgência, que seja normalizado o serviço de coleta de lixo em nossa rua e que sejam tomadas medidas para garantir que essa situação não volte a ocorrer.",
        "Rua Maria José - 123",
        1,
        AppImages.trash));
    followingClaimList.add(Claim(
        user.value,
        2,
        "Além de representar um risco significativo à segurança, tanto de pedestres quanto de veículos, o buraco tem contribuído para o aumento dos danos nos carros e gerado dificuldades no tráfego local. Em dias de chuva, a situação se agrava ainda mais, aumentando o risco de acidentes.",
        "Rua Maria José - 123",
        1,
        AppImages.pothole));
    followingClaimList.add(Claim(
        user.value,
        1,
        "Nos últimos dias, a coleta tem sido irregular, o que tem resultado no acúmulo de lixo nas calçadas e ruas, gerando mau cheiro, atraindo insetos e roedores, além de prejudicar a aparência do bairro.",
        "Rua Maria José - 123",
        2,
        AppImages.trash));
    followingClaimList.add(Claim(
        user.value,
        2,
        "Solicito, com urgência, que sejam tomadas as devidas providências para o reparo do buraco, visando a segurança e bem-estar de todos que utilizam a via. Agradeço pela atenção e fico no aguardo de uma solução rápida para este problema.",
        "Rua Maria José - 123",
        2,
        AppImages.pothole));
  }

  claimsByLocation() {
    locationClaimList.clear();
    locationClaimList.addAll(followingClaimList.where((claim) =>
        removeDiacritics(claim.address.toLowerCase()).contains(
            removeDiacritics(locationController.text.toLowerCase()))));
  }
}
