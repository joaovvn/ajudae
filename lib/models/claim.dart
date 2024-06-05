import 'package:ajudae/models/user.dart';

class Claim {
  User user;
  int claimTypeId = 0;
  String address = "";
  String description = "";
  int status = 0;
  String imageUrl = "";

  Claim(this.user, this.claimTypeId, this.description, this.address,
      this.status, this.imageUrl);
}
