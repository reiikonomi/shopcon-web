import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopcon_web/screens/onboard/splash_screen.dart';
import 'package:shopcon_web/vars.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Variables.firebaseApiKey,
      appId: Variables.firebaseAppId,
      authDomain: Variables.firebaseAuthDomain,
      projectId: Variables.firebaseProjectId,
      storageBucket: Variables.firebaseStorageBucket,
      messagingSenderId: Variables.firebaseMessagingSenderId,
      measurementId: Variables.firebaseMeasurementId,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: ListView(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Ka probleme ne server, ju lutem provoni me vone!",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.height * 0.5,
                    child: SvgPicture.asset(
                      "assets/error.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MainScreen();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
