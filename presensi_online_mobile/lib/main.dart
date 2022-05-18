// import 'package:presensi_online_mobile/provider/jadwal_kelas_provider.dart';
// import 'package:presensi_online_mobile/provider/user_provider.dart';
// import 'package:presensi_online_mobile/services/auth_services.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/view/views/splash/spash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
      // ChangeNotifierProvider(create: (context) => di.sl<UserProvider>()),
      // ChangeNotifierProvider(create: (context) => di.sl<AuthServices>()),
      // ChangeNotifierProvider(create: (context) => di.sl<JadwalKelasProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyITS Presensi',
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
