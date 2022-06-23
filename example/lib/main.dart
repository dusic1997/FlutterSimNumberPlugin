import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:simnumber/siminfo.dart';
import 'package:simnumber/sim_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SimInfo simInfo = SimInfo([]);

  @override
  void initState() {
    super.initState();
    SimNumber.listenPhonePermission((isPermissionGranted) {
      print("isPermissionGranted : " + isPermissionGranted.toString());
      if (isPermissionGranted) {
        initPlatformState();
      } else {}
    });
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      simInfo = await SimNumber.getSimData();
      setState(() {});
    } on PlatformException {
      print("simInfo  : " + "2");
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: simInfo.cards.isEmpty
            ? const Text("No SIM Card Found")
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: simInfo.cards
                      .map((e) => Text("SIM ${e.slotIndex} - ${e.phoneNumber}"))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
