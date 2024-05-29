import 'dart:convert';

import 'package:ajudae/constants/colors.dart';
import 'package:ajudae/constants/texts.dart';
import 'package:ajudae/constants/widgets.dart';
import 'package:ajudae/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    controller.init();
    return Scaffold(
      bottomNavigationBar: Widgets.bottomNavigationBar(0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.mainColor,
                              size: 12,
                            ),
                            const Gap(5),
                            Text(
                              "${controller.selectedCity.value.name}-${controller.selectedCity.value.state}",
                              style: const TextStyle(fontSize: 8.0),
                            )
                          ],
                        ),
                      ),
                      const Gap(4),
                      Text(
                        Texts.welcome(controller.user.value.userName),
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.mainColor,
                    child: CircleAvatar(
                      radius: 18.5,
                      foregroundImage: Image.memory(base64Decode(
                              controller.user.value.profilePicture))
                          .image,
                    ),
                  )
                ],
              ),
              const Gap(24.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Widgets.newsCards(controller.newsList),
                        const Gap(24.0),
                        Text(
                          Texts.claim,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Texts.selectClaim,
                          style: const TextStyle(fontSize: 11.0),
                        ),
                        const Gap(16.0),
                        Widgets.claimTypeCards(),
                        const Gap(24.0),
                        Text(
                          Texts.followUp,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Texts.followClaims,
                          style: const TextStyle(fontSize: 11.0),
                        ),
                        Widgets.claimCards(controller.followingClaimList),
                        const Gap(24.0),
                        Text(
                          Texts.highlights,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const Gap(8.0),
                        Widgets.newsCards(controller.highlightsList)
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
