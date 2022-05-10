import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/view/views/home_screen.dart';
import 'package:presensi_online_mobile/view/views/profile_screen.dart';
import 'package:presensi_online_mobile/view/views/splash/spash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/view/views/training_screen.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      TrainingScreen(),
      HomeScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/Icon/brain.png')),
        activeColor: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/Icon/task-white.png')),
        activeColor: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/Icon/user-outlined.png')),
        activeColor: Colors.white,
        //inactiveColor: Colors.grey,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: false,
        popAllScreensOnTapOfSelectedTab: false,
        backgroundColor: ColorResources.COLOR_PRIMARY,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(40.0),
          colorBehindNavBar: Colors.white,
        ),
        //popAllScreensOnTapOfSelectedTab: false,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
        // Choose the nav bar style with this property.
        onItemSelected: (i) {
          print(i.toString());
        },
      ),
    );
  }

  Future<bool> _willPop() {
    return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SplashScreen()),
            (route) => false) ??
        false;
  }
}
