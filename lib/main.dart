import 'package:englishtalkedesktop/Ui/screens/dashboard.dart/dashboard_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/institution_profile/show_all_institution/show_all_institution_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/login_screen/login_screen.dart';
import 'package:englishtalkedesktop/Ui/screens/question_configuration/show_all_question/show_all_question_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/user_screen/view_all_user/view_all_user_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if (kIsWeb) {
    await Firebase.initializeApp(
        name: 'name-here',
        options: const FirebaseOptions(
            apiKey: "AIzaSyA1zxnwyrhXe1MB5fGWX5bBdsBA-L3hMXQ",
            authDomain: "herainspection-4e99a.firebaseapp.com",
            projectId: "herainspection-4e99a",
            storageBucket: "herainspection-4e99a.appspot.com",
            messagingSenderId: "84768860017",
            appId: "1:84768860017:web:8bb85c609f49e0432838d0",
            measurementId: "G-4TLN77PSFT"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 1080),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider(),
            ),
            ChangeNotifierProvider<ShowAllquestionprovider>(
              create: (context) => ShowAllquestionprovider(),
            ),
            ChangeNotifierProvider<ShowAllInstitutionProvider>(
              create: (context) => ShowAllInstitutionProvider(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            getPages: pages,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 244, 244, 244)),
              useMaterial3: true,
            ),
            home: LoginScreen(),
            // DashboardScreen(),
          ),
        );
        // );
      },
    );
  }
}
