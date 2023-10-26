import 'package:capstone_project_villa/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;

  @override
  void initState() {
    _obscureText = ValueNotifier(true);
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
                  Text(
                    'Login to your\naccount',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),
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
                          labelText: 'Email',
                          prefixIcon: const Icon(Iconsax.sms)),
                      validator: (value) {
                        final emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                        if (value!.isEmpty) {
                          return 'Masukan Email';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return ('Email tidak valid');
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
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
                            prefixIcon: const Icon(Iconsax.shield_security2),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _obscureText.value = !_obscureText.value;
                              },
                              icon: Icon(
                                _obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else if (value.length < 8) {
                              return 'Password harus minimal 8 karakter';
                            } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                                .hasMatch(value)) {
                              return 'Password Salah';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot password?',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 40),
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
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
                            image: NetworkImage(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
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
                        onTap: () {},
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
          )),
    ));
  }
}
