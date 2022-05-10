import 'package:presensi_online_mobile/provider/appointment_provider.dart';
import 'package:presensi_online_mobile/provider/auth_provider.dart';
import 'package:presensi_online_mobile/provider/chat_provider.dart';
import 'package:presensi_online_mobile/provider/contact_provider.dart';
import 'package:presensi_online_mobile/provider/faq_provider.dart';
import 'package:presensi_online_mobile/provider/membership_provider.dart';
import 'package:presensi_online_mobile/provider/onboarding_provider.dart';
import 'package:presensi_online_mobile/provider/profile_provider.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/view/views/splash/spash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AppointmentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ContactProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FaqProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MembershipProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyITS Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorResources.COLOR_PRIMARY,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
