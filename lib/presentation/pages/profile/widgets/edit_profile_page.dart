import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    color: darkGrey,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 28),
                child: Text(
                  'Edit your Profile',
                  style: blackTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 50),
                width: 152,
                height: 152,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/profile/image.png'),
                  ),
                ),
              ),
              TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: grey95,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  filled: true,
                  fillColor: _isChangeFullName.value ? cyanBlue : whiteColor,
                  hintText: 'Full Name',
                  prefixIcon: Icon(
                    Iconsax.user,
                    color: greyColor,
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
              TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: grey95,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  filled: true,
                  fillColor: _isChangeNickname.value ? cyanBlue : whiteColor,
                  hintText: 'Nickname',
                  prefixIcon: Icon(
                    Iconsax.user,
                    color: greyColor,
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
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Iconsax.sms,
                    color: greyColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: grey95,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  filled: true,
                  fillColor: _isChangePhoneNumber.value ? cyanBlue : whiteColor,
                  hintText: 'Phone Number',
                  prefixIcon: Icon(
                    Iconsax.call,
                    color: darkGrey,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isChangePhoneNumber.value = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(
                height: 60.0,
              ),
              CustomButton(onPressed: () {}, text: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}
