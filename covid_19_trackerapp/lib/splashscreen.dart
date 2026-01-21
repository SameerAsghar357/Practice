// ignore_for_file: sized_box_for_whitespace, unused_import

import 'dart:async';

import 'package:covid_tracker/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  // const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WorldStatsPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                      child: Image(image: AssetImage('images/virus.png'))),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * pi,
                    child: child,
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'Covid-19',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tracker App',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Column(
              //   // crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Covid-19',
              //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //     ),
              //     Text(
              //       'Tracker App',
              //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // )
              // SizedBox(height: 30),
              // Text(
              //   'Covid-19\nTracker',
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
