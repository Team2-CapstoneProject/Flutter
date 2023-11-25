import 'dart:io';

import 'package:capstone_project_villa/data/models/request/profile_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/profile/profile_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/profile/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileResponseModel data;
  const EditProfilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _phoneController = TextEditingController();

  late ValueNotifier<bool> _isChangeFullName;
  late ValueNotifier<bool> _isChangeNickname;
  late ValueNotifier<bool> _isChangePhoneNumber;

  @override
  void initState() {
    _isChangeFullName = ValueNotifier(false);
    _isChangeNickname = ValueNotifier(false);
    _isChangePhoneNumber = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? imagePath;
  File? file;

  void _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    setState(() {
      file = imageTemporary;
      imagePath = img.path;

      print('New image path: $imagePath');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: currentTheme ? whiteColor : greyColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 28),
                  child: Text(
                    'edit_your_profile'.tr(),
                    style: currentTheme
                        ? whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold)
                        : blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _getImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 50),
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: file != null
                          ? DecorationImage(
                              image: FileImage(file!), fit: BoxFit.cover)
                          : DecorationImage(
                              image: NetworkImage(widget.data.image),
                              fit: BoxFit.cover),
                    ),
                  ),
                ),

                // Full Name
                TextFormField(
                  controller: _fullNameController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: currentTheme ? darkerGrey : grey95,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    filled: true,
                    fillColor: currentTheme
                        ? darkGrey
                        : (_isChangeFullName.value
                            ? cyanBlue
                            : whiteColor), //blueBlack : darkGrey
                    hintText: 'full_name'.tr(),
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: currentTheme ? grey100 : greyColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isChangeFullName.value = value.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(
                  height: 20.0,
                ),

                // Nickname
                TextFormField(
                  controller: _nickNameController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: currentTheme ? darkerGrey : grey95,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    filled: true,
                    fillColor: currentTheme
                        ? darkGrey
                        : (_isChangeFullName.value ? cyanBlue : whiteColor),
                    hintText: 'nickname'.tr(),
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: currentTheme ? grey100 : greyColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isChangeNickname.value = value.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(
                  height: 20.0,
                ),

                // Email
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: widget.data.email,
                    prefixIcon: Icon(
                      Iconsax.sms,
                      color: currentTheme ? grey100 : greyColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                // Phone number
                TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: currentTheme ? darkerGrey : grey95,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    filled: true,
                    fillColor: currentTheme
                        ? darkGrey
                        : (_isChangeFullName.value ? cyanBlue : whiteColor),
                    hintText: 'phone_number'.tr(),
                    prefixIcon: Icon(
                      Iconsax.call,
                      color: currentTheme ? grey100 : greyColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isChangePhoneNumber.value = value.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(
                  height: 40.0,
                ),
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileLoaded) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacementNamed(
                              context,
                              ProfilePage.routeName,
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
                                  'update_profile_successfull'.tr(),
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9.0,
                                ),
                                Text(
                                  'successfully_update_profile'.tr(),
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
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        print('Full Name: ${_fullNameController.text}');
                        print('Nickname: ${_nickNameController.text}');
                        print('Phone Number: ${_phoneController.text}');
                        print('Image Path: ${file?.path}');

                        if (formKey.currentState!.validate()) {
                          context.read<ProfileBloc>().add(
                                ProfileUpdateEvent(
                                    profileRequestModel: ProfileRequestModel(
                                      fullname: _fullNameController.text,
                                      nickname: _nickNameController.text,
                                      phone_number: _phoneController.text,
                                    ),
                                    imageFile: file),
                              );
                        }
                      },
                      text: 'save'.tr(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
