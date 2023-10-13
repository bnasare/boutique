import 'package:boutique/screens/home.dart';
import 'package:boutique/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'consts/theme.dart';
import 'screens/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Onboarding(),
      theme: Styles.themeData(context),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProductDetails.routeName: (context) => const ProductDetails(),
      },
    );
  }
}
