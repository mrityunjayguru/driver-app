
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:route_roster_pro/routes/app_pages.dart';

import 'firebase_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*  // Firebase initialization before runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  Get.put(FirebaseNotificationService()).init();*/
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (value) =>   runApp(MyApp()),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Material(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Track Route Driver App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xffD9E821),
            ),
            useMaterial3: true,
          ),

          supportedLocales: [
            const Locale('hi'),
            const Locale('en'),
          ],
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
    });
  }
}
