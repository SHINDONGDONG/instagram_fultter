import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_fultter/responsive/mobile_screen_layout.dart';
import 'package:instagram_fultter/responsive/responsive_layout_screen.dart';
import 'package:instagram_fultter/responsive/web_screen_layout.dart';
import 'package:instagram_fultter/screen/login_screen.dart';
import 'package:instagram_fultter/utils/colors.dart';

void main() async {
  //initilizeapp이 초기화되었는지 알수있다
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyA3KoLXtZ3zLtB48J6bVBrxqbqEiHI9Cy0',
        appId: '1:533089761772:web:34ec0a839b7646cda268c9',
        messagingSenderId: '533089761772',
        projectId: 'instagram-tut-30659',
        storageBucket: 'instagram-tut-30659.appspot.com'
      ),
    );
  } else {
  await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: Scaffold(
          // body: ResponsiveLayout(
          //   webScreenLayout: WebScreenLayout(),
          //   mobileScreenLayout: MobileScreenLayout(),
          // ),
          body: LoginScreen(),
      )
    );
  }
}
