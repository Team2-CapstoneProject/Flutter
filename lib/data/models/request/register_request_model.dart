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
  //     email: email,
  //     fullname: fullname,
  //     nickname: nickname,
  //     password: password,
  //     phoneNumber: phone_number ?? this.phoneNumber,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory RegisterRequestModel.fromJson(String source) =>
  //     RegisterRequestModel.fromMap(json.decode(source));

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'image': image,
  //     'email': email,
  //     'fullname': fullname,
  //     'nickname': nickname,
  //     'password': password,
  //     'phone_number': phoneNumber,
  //   };
  // }

  // factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
  //   return RegisterRequestModel(
  //     image: map['image'] as String?,
  //     email: map['email'] as String?,
  //     fullname: map['fullname'] as String?,
  //     nickname: map['nickname'] as String?,
  //     password: map['password'] as String?,
  //     phoneNumber: map['phone_number'] as int?,
  //   );
  // }
}
