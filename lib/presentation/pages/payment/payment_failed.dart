import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';

class PaymentFailedPage extends StatefulWidget {
  const PaymentFailedPage({super.key});

  @override
  State<PaymentFailedPage> createState() => _PaymentFailedPageState();
}

class _PaymentFailedPageState extends State<PaymentFailedPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Payment Failed',
        desc: 'Sorry, your payment failed',
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
