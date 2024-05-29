import 'package:ajudae/models/user.dart';

class Claim {
  User user;
  int claimTypeId = 0;
  String address = "";
  int status = 0;

  Claim(this.user, this.claimTypeId, this.address, this.status);
}
