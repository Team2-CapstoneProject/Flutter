import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _newPasswordController = TextEditingController();
  final _confirmNewPaswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPaswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 72.0,
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
                  margin: const EdgeInsets.only(top: 30, bottom: 72),
                  child: Text(
                    'Change your\nPassword',
                    style: blackTextStyle.copyWith(
                        fontSize: 32, fontWeight: semiBold),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _newPasswordController,
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
                    labelText: 'New Password',
                    labelStyle: TextStyle(color: greyColor),
                    prefixIcon: Icon(
                      Iconsax.shield_security2,
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _confirmNewPaswordController,
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
                    labelText: 'Confirm New Password',
                    labelStyle: TextStyle(color: greyColor),
                    prefixIcon: Icon(
                      Iconsax.shield_security2,
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                CustomButton(onPressed: () {}, text: 'Continue')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
