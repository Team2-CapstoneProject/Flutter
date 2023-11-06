import 'dart:io';

import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProfilePage extends StatefulWidget {
  static const String routeName = '/registerprofile';

  final AuthResponseModel data;
  const RegisterProfilePage({super.key, required this.data});

  @override
  State<RegisterProfilePage> createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
  final _fullNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String imageName = "";
  File? file;

  void _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    setState(() {
      file = imageTemporary;
      imageName = img.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Fill your Profile',
                      style: blackTextStyle.copyWith(
                          fontSize: 32, fontWeight: semiBold),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _getImage();
                      },
                      child: Container(
                        width: 152,
                        height: 152,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grey95,
                          image: file != null
                              ? DecorationImage(
                                  image: FileImage(file!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: file == null
                            ? Icon(
                                Iconsax.gallery_edit,
                                color: greyColor,
                              )
                            : null,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: grey95,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: blackColor.withOpacity(0.1),
                          ),
                        ),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: greyColor),
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: _nickNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: grey95,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: blackColor.withOpacity(0.1),
                          ),
                        ),
                        labelText: 'Nickname',
                        labelStyle: TextStyle(color: greyColor),
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: grey95,
                          ),
                        ),
                        hintText: widget.data.email,
                        prefixIcon: Icon(
                          Iconsax.sms,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: grey95,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: blackColor.withOpacity(0.1),
                          ),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: greyColor),
                        prefixIcon: Icon(
                          Iconsax.call,
                          color: darkGrey,
                        ),
                        hintText: '08123456789',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacementNamed(
                              context,
                              BottomNavbarPage.routeName,
                            );
                          });
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/auth/success_regis.png',
                                  height: 174,
                                  width: 174,
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  'Register Successfull',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9.0,
                                ),
                                Text(
                                  'Successfully register your new account',
                                  textAlign: TextAlign.center,
                                  style: grey2TextStyle.copyWith(
                                    fontSize: 17,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    text: 'Register',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
