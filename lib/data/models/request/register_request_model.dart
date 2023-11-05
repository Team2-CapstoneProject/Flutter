class RegisterRequestModel {
  // String? image;
  String? email;
  // String? fullname;
  // String? nickname;
  String? password;
  // int? phoneNumber;

  RegisterRequestModel({
    // this.image,
    this.email,
    // this.fullname,
    // this.nickname,
    this.password,
    // this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      // 'image': image,
      'email': email,
      // 'fullname': fullname,
      // 'nickname': nickname,
      'password': password,
      // 'phone_number': phoneNumber,
    };
  }

  // RegisterRequestModel copyWith({
  //   String? image,
  //   String? fullname,
  //   String? nickname,
  //   int? phone_number,
  // }) {
  //   return RegisterRequestModel(
  //     image: image ?? this.image,
  //     email: email ?? this.email,
  //     fullname: fullname ?? this.fullname,
  //     nickname: nickname ?? this.nickname,
  //     password: password ?? this.password,
  //     phoneNumber: phone_number ?? this.phoneNumber,
  //   );
  // }
}
