import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/theme/theme.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF2D7D7),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            boxShadow: [
              const BoxShadow(
                color: Color(0xFFF2D7D7),
                blurRadius:1,
              ),
            ],
          ),
          child: Icon(Icons.pets_outlined,size: 50,),
        ),
        Text('Pets',style: Styles.black12,)
      ],
    );
  }
}
