import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/modules/home/view/local_widget/category_items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(8, (index) => CategoryItem()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
