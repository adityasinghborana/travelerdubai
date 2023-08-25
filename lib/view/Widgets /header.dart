import 'package:flutter/material.dart';
import 'package:get/get.dart';

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Setting the height to 200px
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 1440), // Limiting to a common desktop width
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Image.asset(
                  "./assets/logo.png",
                  height: 80,
                  width: 160,
                  fit: BoxFit.contain,
                ),
                // Navigation Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navItem("Home", '/home'),
                    _navItem("About Us", '/Aboutus'),
                    _navItem("Experiences", '/experiences'),
                    _navItem("Contact Us", '/contactus'),
                  ],
                ),
                // Authentication Buttons
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Get.toNamed('/Login'),
                      child: Text("Login"),
                    ),
                    SizedBox(width: 20), // Spacing between buttons
                    ElevatedButton(
                      onPressed: () => Get.toNamed('/Signup'),
                      child: Text("Signup"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, String route) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15), // Consistent spacing for nav items
        child: Text(title),
      ),
    );
  }
}
