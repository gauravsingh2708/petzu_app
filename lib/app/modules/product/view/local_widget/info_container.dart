import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/theme/colors_value.dart';
import 'package:flutter_blueprint/app/theme/styles.dart';

class Info extends StatelessWidget {
  Info({this.title,this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: Styles.grey14.copyWith(color: ColorsValue.primaryColor),),
          Text(value,style: Styles.black18,)
        ],
      ),
    );
  }
}
