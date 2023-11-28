import 'package:englishtalkedesktop/Ui/dashboard.dart/dashboard_screen.dart';
import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //flutter pub add
  setPathUrlStrategy();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBtTliWN_WgN32W0tmzad78y5VURuImn0w",
            authDomain: "newherainspection.firebaseapp.com",
            projectId: "newherainspection",
            storageBucket: "newherainspection.appspot.com",
            messagingSenderId: "723209975214",
            appId: "1:723209975214:web:56d810f70824aa2ca0443f",
            measurementId: "G-4SR8K8YEER"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your ation.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 1080),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          getPages: pages,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 244, 244, 244)),
            useMaterial3: true,
          ),
          home: DashboardScreen(),
        );
      },
    );
  }
}
