import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  /// Current index in [HomeView]
  int currentTab = 0;

  final List<BottomNavigationBarItem> tab = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.pets_outlined), label: 'Pet Care'),
    const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.person_outline), label: 'Training'),
  ];

  void changeTab(int index) {
    currentTab = index;
    update();
  }
}