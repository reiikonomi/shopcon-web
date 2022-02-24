import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shopcon_web/auth/login.dart';
import 'package:shopcon_web/auth/registration.dart';
import 'package:shopcon_web/screens/allProductsJobs/alljob.dart';
import 'package:shopcon_web/screens/allProductsJobs/allproducts.dart';
import 'package:shopcon_web/screens/privacy_policy_screen.dart';
import 'package:shopcon_web/screens/searching/search_jobs.dart';
import 'package:shopcon_web/screens/searching/searchproducts.dart';

class MenuController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => [
        "Kerko pune",
        "Kerko produkte",
        "Identifikohu",
        "Rregjistrohu",
        "Te gjitha punet",
        "Te gjitha produktet",
        "Privacy Policy"
      ];
  List<Widget> get menuPages => [
        const SearchJobs(),
        const SearchProducts(),
        const LoginScreen(),
        const RegistrationScreen(),
        const AllJobs(),
        const AllProducts(),
        const PrivacyPolicy()
      ];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
