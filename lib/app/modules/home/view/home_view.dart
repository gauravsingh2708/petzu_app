import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/modules/home/controller/home_controller.dart';
import 'package:flutter_blueprint/app/modules/home/view/local_widget/bottom_navigation_bar.dart';
import 'package:flutter_blueprint/app/modules/home/view/local_widget/category_items.dart';
import 'package:flutter_blueprint/app/modules/home/view/page/home_page.dart';
import 'package:flutter_blueprint/app/modules/home/view/page/pet_care_page.dart';
import 'package:flutter_blueprint/app/modules/home/view/page/profile_page.dart';
import 'package:flutter_blueprint/app/theme/theme.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:(_controller)=> Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Petzu',style: Styles.boldBlack22,),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search_outlined,color: Colors.black,), onPressed: (){}),
          IconButton(icon: Icon(Icons.favorite_outline,color: Colors.black,), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,), onPressed: (){})
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
      drawer: Drawer(),
      body: IndexedStack(
        index: _controller.currentTab,
        children: [
          HomePage(),
          PetCarePage(),
          ProfilePage()
        ],
      ),
    ),
  );
}
