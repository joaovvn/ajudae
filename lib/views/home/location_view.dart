import 'package:ajudae/constants/colors.dart';
import 'package:ajudae/constants/texts.dart';
import 'package:ajudae/constants/widgets.dart';
import 'package:ajudae/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    controller.init();
    controller.claimsByLocation();
    return Scaffold(
      bottomNavigationBar: Widgets.bottomNavigationBar(1),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
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
                    foregroundImage:
                        Widgets.getImage(controller.user.value.profilePicture)
                            .image,
                  ),
                )
              ],
            ),
            const Gap(24.0),
            Text(
              Texts.claimsAround,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              Texts.claimsSearch,
              style: const TextStyle(fontSize: 11.0),
            ),
            const Gap(16.0),
            Row(
              children: [
                Icon(
                  Icons.gps_fixed,
                  color: AppColors.mainColor,
                ),
                const Gap(8),
                Expanded(
                  child: Container(
                    height: 30,
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
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      textAlignVertical: TextAlignVertical.center,
                      cursorHeight: 12,
                      controller: controller.locationController,
                      onChanged: (_) => controller.claimsByLocation(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: AppColors.mainColor),
                    ),
                  ),
                )
              ],
            ),
            const Gap(24),
            Widgets.locationClaims(controller.locationClaimList)
          ],
        ),
      ),
    );
  }
}
