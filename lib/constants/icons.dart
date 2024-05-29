class AppIcons {
  static String home = "assets/icons/home.png";
  static String thrashCollection = "assets/icons/trash_collection.png";
  static String pothole = "assets/icons/pothole.png";
  static String streetLight = "assets/icons/street_light.png";
  static String trafficLight = "assets/icons/traffic_light.png";

  static String getClaimIcon(int claimTypeId) {
    switch (claimTypeId) {
      case 1:
        return thrashCollection;
      case 2:
        return pothole;
      case 3:
        return streetLight;
      case 4:
        return trafficLight;
      default:
        return "";
    }
  }
}
