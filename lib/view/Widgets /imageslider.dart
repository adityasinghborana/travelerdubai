import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';

class ImageSliderWidget extends StatefulWidget {
  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext Context) {
    return Container(
      height: 200, // Adjust the height according to your needs
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Image.asset(
            'assets/dubai.jpg',
            fit: BoxFit.cover,
          ), // Replace with your own image asset
          Image.asset('assets/event.jpg',
              fit: BoxFit.cover), // Replace with your own image asset
          Image.asset('assets/safari.jpg',
              fit: BoxFit.cover), // Replace with your own image asset
          Image.asset('assets/event.jpg',
              fit: BoxFit.cover), // Replace with your own image asset
          Image.asset('assets/dubai.jpg',
              fit: BoxFit.cover), // Replace with your own image asset
          // Add more images if needed
        ],
      ),
    );
  }
}
