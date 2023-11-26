import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Payment Success',
        desc: 'Thanks for your payment',
        btnOkOnPress: () {
          Navigator.pushNamed(context, BottomNavbarPage.routeName);
        },
      )..show();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
