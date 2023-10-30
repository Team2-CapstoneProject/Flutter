import 'package:capstone_project_villa/presentation/pages/authentication/register_page.dart';
import 'package:capstone_project_villa/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RegisterProfilePage extends StatefulWidget {
  const RegisterProfilePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: darkGrey,
                  ),
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
                  child: Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: grey95,
                    ),
                    child: Icon(
                      Iconsax.gallery_edit,
                      color: greyColor,
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
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
                      labelText: 'Email',
                      labelStyle: TextStyle(color: greyColor),
                      prefixIcon: Icon(
                        Iconsax.sms,
                        color: greyColor,
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
                Container(
                  height: 55,
                  margin: const EdgeInsets.only(top: 60),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text('Register'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
