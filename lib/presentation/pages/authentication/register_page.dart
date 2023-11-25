import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/request/register_request_model.dart';
import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/auth/auth_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/widgets/register_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
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
                      'Create new\naccount',
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
                                    color: greyColor),
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

                    const SizedBox(
                      height: 30.0,
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterProfilePage(
                                  data: AuthResponseModel(
                                      token: '',
                                      email: _emailController.text,
                                      fullname: '',
                                      image: '',
                                      nickname: '',
                                      phoneNumber: ''),
                                ),
                              ),
                            );
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
                                final registerModel = RegisterRequestModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                // print(registerModel.toJson());
                                context.read<AuthBloc>().add(
                                      AuthRegisterEvent(
                                        registerRequestModel: registerModel,
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

                    // Login with Google
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
                          "Already have account? ",
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
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
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
      ),
    );
  }
}
