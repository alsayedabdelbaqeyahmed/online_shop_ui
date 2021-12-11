import 'package:online_shop_ui/constants/constant_data.dart';

class User {
  final String userName, email, phone, password, address, usertype;

  const User({
    this.userName,
    this.email,
    this.phone,
    this.password,
    this.address,
    this.usertype,
  });

  factory User.fromJason(Map<String, dynamic> map) {
    return User(
      userName: map[conUserNmae],
      address: map[conaddress],
      email: map[conemail],
      password: map[conpassword],
      phone: map[conphone],
      usertype: map[conusertype],
    );
  }

  Map<String, dynamic> toJason() {
    return {
      conUserNmae: userName,
      conaddress: address,
      conemail: email,
      conpassword: password,
      conphone: phone,
      conusertype: usertype,
    };
  }
}
