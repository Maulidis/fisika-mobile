import 'package:fisika_mobile_app/app/modules/data_home/views/data_home_view.dart';
import 'package:fisika_mobile_app/app/modules/detail_bab/views/detail_bab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../constans.dart';
import '../controllers/home_controller.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    final HomeController controller = Get.find<HomeController>();
    return [
      DataHomeView(),
      DetailBabView(),
      DetailBabView(),
      DetailBabView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: kBg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.quiz),
        title: "Quiz",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: kBg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: "Favorit",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: kBg,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.rocket),
        title: "Lab",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: kBg,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: kBlue,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false, // Ubah menjadi false
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
