import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/style.dart';

import 'widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => GoRouter.of(context).pushReplacement(AppGoRouter.homePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConsts.mainColor,
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
