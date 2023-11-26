import 'package:capstone_project_villa/presentation/pages/payment/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  WebViewController? _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print('onPageStarted $url');
            // Berhasil Payment
            if (url.contains('status_code=200&transaction_status=settlement')) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PaymentSuccessPage();
              }));
            }
            // Gagal Payment
            if (url.contains('status_code=202&transaction_status=deny')) {}
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller!),
    );
  }
}
