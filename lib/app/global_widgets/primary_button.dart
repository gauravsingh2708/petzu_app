import 'package:flutter/material.dart';

import '../theme/theme.dart';


class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.title,this.disable});
  final String title;
  final bool disable;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Dimens.screenWidth,
      decoration: BoxDecoration(
        color: !disable?ColorsValue.primaryColor.withOpacity(0.2):ColorsValue.primaryColor,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Center(child: Text(title,style: Styles.boldWhite23,)),
    );
  }
}
