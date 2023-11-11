import 'package:capstone_project_villa/data/models/request/forget_password_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/auth/auth_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPage extends StatefulWidget {
  static const String routeName = '/forget';
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPaswordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;
  late ValueNotifier<bool> _confirmObscureText;

  @override
  void initState() {
    _obscureText = ValueNotifier(true);
    _confirmObscureText = ValueNotifier(true);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmNewPaswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 52.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginPage.routeName,
                      );
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
                    controller: _emailController,
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
                      labelText: 'Email',
                      labelStyle: TextStyle(color: greyColor),
                      prefixIcon: Icon(
                        Iconsax.frame_4,
                        color: greyColor,
                      ),
                    ),
                    validator: (value) {
                      final emailRegex = RegExp(
                          r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return ('Invalid email');
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: _obscureText,
                      builder: (context, value, _) {
                        return TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: _obscureText.value,
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
                              Iconsax.frame_4,
                              color: greyColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _obscureText.value = !_obscureText.value;
                              },
                              icon: Icon(
                                _obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'The password cannot be empty';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                                .hasMatch(value)) {
                              return 'The password must contain capital letters and numbers';
                            }
                            return null;
                          },
                        );
                      }),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _confirmObscureText,
                    builder: (context, value, child) {
                      return TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: _confirmObscureText.value,
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
                            Iconsax.frame_4,
                            color: greyColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _confirmObscureText.value =
                                  !_confirmObscureText.value;
                            },
                            icon: Icon(
                              _confirmObscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: greyColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Re-Enter Password");
                          }
                          if (_confirmNewPaswordController.text !=
                              _newPasswordController.text) {
                            return "Reconfirm the password does not match";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmNewPaswordController.text = value!;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) async {
                      if (state is AuthLoaded) {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginPage.routeName,
                        );
                      }
                      if (state is AuthError) {
                        final snackBar = SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final forgetModel = ForgetPasswordRequestModel(
                              email: _emailController.text,
                              newpassword: _newPasswordController.text,
                            );
                            print(forgetModel.toJson());
                            context.read<AuthBloc>().add(
                                  AuthForgetPasswordEvent(
                                    forgetPasswordRequestModel: forgetModel,
                                  ),
                                );
                          }
                        },
                        text: 'Continue',
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
