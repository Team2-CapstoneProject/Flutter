import 'package:another_flushbar/flushbar.dart';
import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/login_request_model.dart';
import 'package:capstone_project_villa/presentation/bloc/auth/auth_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/widgets/forgot_page.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/register_page.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;
  late ValueNotifier<bool> _isPasswordFocused;

  @override
  void initState() {
    _obscureText = ValueNotifier(true);
    _isPasswordFocused = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Login to your\naccount',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),

                  // Form Email
                  Container(
                    margin: const EdgeInsets.only(top: 56),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
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
                  ),

                  // Form Password
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 24),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _obscureText,
                      builder: (context, value, _) {
                        return TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText.value,
                          textInputAction: TextInputAction.done,
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
                            prefixIcon: Icon(
                              Iconsax.frame_4,
                              color: greyColor,
                            ),
                            filled: true,
                            fillColor: _isPasswordFocused.value
                                ? cyanBlue
                                : whiteColor,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: greyColor),
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
                          onChanged: (value) {
                            setState(() {
                              _isPasswordFocused.value = value.isNotEmpty;
                            });
                          },
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
                      },
                    ),
                  ),

                  // Forget Password
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot password?',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 14.0,
                  ),

                  // Button
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) async {
                        if (state is AuthLoaded) {
                          await AuthLocalDataSource().saveToken(
                            state.authResponseModel.token,
                          );
                          print('token : ${state.authResponseModel.token}');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            BottomNavbarPage.routeName,
                            (route) => false,
                          );
                          Flushbar(
                            message: state.authResponseModel.message,
                            duration: const Duration(seconds: 3),
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(10),
                            flushbarStyle: FlushbarStyle.FLOATING,
                            flushbarPosition: FlushbarPosition.BOTTOM,
                            padding: EdgeInsets.all(16),
                          )..show(context);
                        }
                        if (state is AuthError) {
                          Flushbar(
                            message: state.message,
                            duration: const Duration(seconds: 3),
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(10),
                            flushbarStyle: FlushbarStyle.FLOATING,
                            flushbarPosition: FlushbarPosition.BOTTOM,
                            padding: EdgeInsets.all(16),
                          )..show(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final loginModel = LoginRequestModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              print(loginModel.toJson());
                              context.read<AuthBloc>().add(
                                    AuthLoginEvent(
                                      loginRequestModel: loginModel,
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 40.0,
                  ),

                  // Text Or
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: white70Color,
                          height: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.0),
                        child: Text(
                          'or',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: white70Color,
                          height: 1,
                        ),
                      ),
                    ],
                  ),

                  // Login With Google
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 52),
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: grey95,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            height: 24,
                            width: 24,
                            image: AssetImage(
                              'assets/auth/google.png',
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Sign in with Google',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: bold,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
