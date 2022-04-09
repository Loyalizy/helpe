import 'package:AnimeTare/ui/BaseNavigationBar.dart';
import 'package:AnimeTare/ui/detail_page.dart';
import 'package:AnimeTare/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseNavigationBar(),
    );
  }
}
