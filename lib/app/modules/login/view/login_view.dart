import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/data/enum.dart';
import 'package:flutter_blueprint/app/global_widgets/primary_button.dart';
import 'package:flutter_blueprint/app/modules/login/controller/login_controller.dart';
import 'package:flutter_blueprint/app/utils/string_constants.dart';
import 'package:get/state_manager.dart';
import '../../../theme/styles.dart';
import '../../../theme/theme.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: GetBuilder<LoginController>(
      builder:(_con)=> Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimens.fourty),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _logoAndTitle(),
                SizedBox(height: Dimens.thirty,),
                _loginAndSignUpTitle(),
                SizedBox(height: Dimens.twenty,),
                _mobileTextField(_con),
                SizedBox(height: Dimens.twenty,),
                InkWell(
                    onTap: (){
                       _con.onPressedLoginButton();
                    },
                    child: PrimaryButton(title: StringConstants.continueButton,disable: _con.showLoginButton,)
                )
              ],
            ),
          ),
          if(_con.pageStatus == PageStatus.loading)
            Container(
              height: Dimens.screenHeight,
              width:Dimens.screenWidth,
              color: Colors.blueGrey.withOpacity(Dimens.one/Dimens.two),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    ),
  );
  /// This Widget return the logo and tit/e of the app
  Widget _logoAndTitle() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: Dimens.hundred,
          width: Dimens.hundred,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/petzu_login.gif'),
                fit: BoxFit.cover
              )
          ),
        ),

      ],
    ),
  );

  /// This Widget return which show Login and SignUp title
  Widget _loginAndSignUpTitle() => RichText(
    text: TextSpan(
        text: StringConstants.login,
        style: Styles.navy20,
        children: [
          TextSpan(text: StringConstants.orText,style: Styles.black12,),
          TextSpan(text: StringConstants.signUp,style: Styles.navy20,)
        ]
    ),
  );

  /// Function return TextField
  Widget _mobileTextField(LoginController con) => TextFormField(
    style: Styles.black18.copyWith(height: Dimens.one),
    onChanged: (value)=>con.enableLoginButton(value),
    decoration: InputDecoration(
      labelText: StringConstants.mobileNumber,
      labelStyle: Styles.black12,
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.three),
      ),
    ),
  );
}
