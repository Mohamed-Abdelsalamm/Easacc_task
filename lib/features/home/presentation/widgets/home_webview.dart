import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../manager/home_cubit.dart';

class HomeWebView extends StatefulWidget {
  final String link;
  const HomeWebView({super.key, required this.link});

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => cubit.setPageLoading(true),
        onPageFinished: (url) => cubit.setPageLoading(false),
        onNavigationRequest: (req) => NavigationDecision.navigate,
      ))
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
