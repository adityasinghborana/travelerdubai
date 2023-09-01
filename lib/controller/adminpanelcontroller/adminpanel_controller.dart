import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travelerdubai/view/screens/panel%20views/dashboardpage.dart';
import 'package:travelerdubai/view/screens/panel%20views/settings.dart';
import 'package:travelerdubai/view/screens/panel%20views/userspage.dart';

class AdminController extends GetxController {
  var currentPageIndex = 0.obs;
  var pages = [DashboardPage(), UsersPage(), SettingsPage()].obs;

  Widget get currentPage => pages[currentPageIndex.value];

  void changePage(int index) {
    currentPageIndex.value = index;
  }
}
