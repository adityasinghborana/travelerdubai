import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/adminpanelcontroller/adminpanel_controller.dart';
import 'package:travelerdubai/service/auth.dart';
import 'package:travelerdubai/view/screens/homepage.dart';
import 'package:travelerdubai/view/screens/homescreen.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      drawer: DrawerMenu(),
      body: GetX<AdminController>(
        builder: (controller) {
          return controller.currentPage;
        },
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthClass authClass = AuthClass();
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Admin Menu'),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () => Get.find<AdminController>().changePage(0),
          ),
          ListTile(
            title: Text('Users'),
            onTap: () {
              Get.find<AdminController>().changePage(1);
              Navigator.pop(context); // Close the drawer
            },
          ),
          SubMenuExpansionTile(),
          ListTile(
            title: Text('Users'),
            onTap: () {
              Get.find<AdminController>().changePage(1);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await authClass.signOut(context: context);
              Get.offAllNamed(
                  '/home'); // This will navigate to Homepage and remove all previous routes
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

class SubMenuExpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Settings'),
      children: [
        SubMenuItem('Home Settings'),
        SubMenuItem('About Us Settings'),
      ],
    );
  }
}

class SubMenuItem extends StatelessWidget {
  final String title;

  SubMenuItem(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle sub-menu item tap
      },
    );
  }
}
