import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/adminpanelcontroller/adminpanel_controller.dart';
import 'package:travelerdubai/view/screens/homescreen.dart';
import 'package:travelerdubai/view/screens/Contactus.dart';
import 'package:travelerdubai/view/screens/Aboutus.dart';
import 'package:travelerdubai/view/screens/experiences.dart';

import 'package:travelerdubai/view/screens/auth/signin.dart';
import 'package:travelerdubai/view/screens/auth/signup.dart';

import 'package:travelerdubai/view/screens/panel%20views/dashboardpage.dart';
import 'package:travelerdubai/view/screens/panel%20views/settings.dart';
import 'package:travelerdubai/view/screens/panel%20views/userspage.dart';
import 'package:travelerdubai/view/screens/panel.dart';
import 'package:travelerdubai/view/Widgets%20/featurewidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA4f2YsvWuQ8GCn8FvPC82LUvQW493Fau8",
        authDomain: "travelerdubai-9a6ed.firebaseapp.com",
        projectId: "travelerdubai-9a6ed",
        storageBucket: "travelerdubai-9a6ed.appspot.com",
        messagingSenderId: "191732956201",
        appId: "1:191732956201:web:3c7e9bbaeaa8f025d5f038",
        measurementId: "G-4PG69HVJ6C"),
  );
  Get.put(AdminController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext Context) {
    return GetMaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/Login',
          page: () => SigninPage(),
          middlewares: [MyMiddelware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/Signup',
          page: () => SignupPage(),
          middlewares: [MyMiddelware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/home',
          page: () => Homescreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/Aboutus',
          page: () => AboutUsPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/contactus',
          page: () => Contactus(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/experiences',
          page: () => experiences(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/rough',
          page: () => AdminPanel(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/settings',
          page: () => SettingsPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/userpage',
          page: () => UsersPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/dashboardpage',
          page: () => DashboardPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/panel',
          page: () => AdminPanel(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ],
    );
  }
}

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
