import 'dart:convert';

import 'package:ajudae/constants/colors.dart';
import 'package:ajudae/constants/icons.dart';
import 'package:ajudae/constants/texts.dart';
import 'package:ajudae/models/claim.dart';
import 'package:ajudae/models/claim_type.dart';
import 'package:ajudae/models/news.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Widgets {
  static Widget newsCards(List<News> news) {
    RxInt pagePosition = 0.obs;
    return Column(
      children: [
        SizedBox(
          height: 128,
          child: PageView.builder(
              itemCount: news.length,
              onPageChanged: (value) {
                pagePosition.value = value;
              },
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(33.0, 60.0, 33.0, 0.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: Image.memory(
                            base64Decode(news[index].image),
                          ).image),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news[index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text(
                        news[index].description,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10.0),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Obx(() {
          return DotsIndicator(
            decorator: DotsDecorator(
                size: const Size(8, 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                activeSize: const Size(16, 4),
                activeColor: AppColors.mainColor,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0))),
            dotsCount: news.length,
            position: pagePosition.value,
          );
        })
      ],
    );
  }

  static Widget claimTypeCards() {
    List<ClaimType> claimTypes = [
      ClaimType("Coleta de lixo", AppIcons.thrashCollection),
      ClaimType("Buraco na rua", AppIcons.pothole),
      ClaimType("Iluminação pública", AppIcons.streetLight),
      ClaimType("Semáforo", AppIcons.trafficLight)
    ];
    return SizedBox(
      height: 72,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: claimTypes.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 18),
          itemBuilder: (context, index) {
            return Container(
              height: 72,
              width: 72,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 26,
                    claimTypes[index].icon,
                    fit: BoxFit.fitHeight,
                  ),
                  const Gap(4),
                  Text(
                    textAlign: TextAlign.center,
                    claimTypes[index].name,
                    style: const TextStyle(fontSize: 9),
                  )
                ],
              ),
            );
          }),
    );
  }

  static Widget claimCards(List<Claim> claimList) {
    return SizedBox(
      height: 112,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: claimList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(3.0, 8.0, 0.0, 8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              foregroundImage: Image.memory(base64Decode(
                                      claimList[index].user.profilePicture))
                                  .image,
                            ),
                            const Gap(8),
                            Text(
                              textAlign: TextAlign.center,
                              claimList[index].user.userName,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Image.asset(
                              height: 16,
                              AppIcons.getClaimIcon(
                                  claimList[index].claimTypeId),
                              fit: BoxFit.fitHeight,
                            ),
                            const Gap(4),
                            Text(
                              textAlign: TextAlign.center,
                              Texts.getClaimName(claimList[index].claimTypeId),
                              style: const TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 16,
                              color: AppColors.mainColor,
                            ),
                            const Gap(4),
                            Text(
                              textAlign: TextAlign.center,
                              claimList[index].address,
                              style: const TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.getColorByStatus(
                              claimList[index].status),
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(8))),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  static Widget bottomNavigationBar(int position) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 8,
        ),
      ]),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_rounded,
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.location_pin,
              ))
        ],
        iconSize: 32,
        selectedIconTheme: IconThemeData(color: AppColors.mainColor),
      ),
    );
  }
}
