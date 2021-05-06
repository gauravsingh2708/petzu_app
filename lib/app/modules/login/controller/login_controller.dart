import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blueprint/app/data/enum.dart';
import 'package:flutter_blueprint/app/modules/login/view/page/otp_view.dart';
import 'package:flutter_blueprint/app/routes/routes_management.dart';
import 'package:flutter_blueprint/app/utils/utility.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ///Firebase Auth part
  ///Instance of Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  String localVerificationId = '';
  /// Flag to show login button
  bool showLoginButton = false;

  /// The current status of the page.
  PageStatus pageStatus = PageStatus.idle;


  /// Variable to store mobile number
  String number = '';

  ///Function call when pressed login button
  void onPressedLoginButton()async{
    if(number.length == 10){
      await loginWithPhoneNumber(number);
    }
    else{
      Utility.showError('Enter Correct phone number');
    }
  }
  ///Function is used to login user with phone number and otp
  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    updatePageStatus(PageStatus.loading);
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: '+91$phoneNumber',
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) {
            auth.signInWithCredential(authCredential).then((result) {
              RoutesManagement.goToHome();
            }).catchError((String e) {
              print('Inside verification error');
              Utility.printELog(e.toString());
            });
          },
          verificationFailed: (authException) {
            Utility.printELog(authException.message);
          },
          codeSent: (String verificationId, [int forceResendingToken]){
            localVerificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId){
            localVerificationId = verificationId;
          }
      ).whenComplete((){
        updatePageStatus(PageStatus.idle);
        RoutesManagement.goToOtpScreen();
      });
    } catch (onError) {
      updatePageStatus(PageStatus.idle);
      Utility.printELog(onError.toString());
    }
  }

  void loginWithOtp(){
    updatePageStatus(PageStatus.loading);
    final credential = PhoneAuthProvider.credential(verificationId: localVerificationId, smsCode: pin);
    auth.signInWithCredential(credential).then((value) => RoutesManagement.goToHome());
  }



  /// Function to update the [showLoginButton] flag
  void enableLoginButton(String value) {
    if (value.length == 10) {
      number = value;
      showLoginButton = true;
    } else {
      showLoginButton = false;
    }
    update();
  }

  ///############################################### [OtpView] ################################################################

  /// From Here all Element in for [OtpView]

  TextEditingController textEditingController = TextEditingController();


  bool showCounter = true;
  bool hasError = false;
  String pin = '';
  final formKey = GlobalKey<FormState>();

  void onPressedLogin(String value) {
    if (value.length == 6) {
      hasError = true;
      pin = value;
    }
    update();
  }

  void updateCounterView(){
    showCounter = !showCounter;
    update();
  }

  /// Update the page status
  /// [pageStatus] : the new page status.
  void updatePageStatus(PageStatus pageStatus) {
    this.pageStatus = pageStatus;
    update();
  }
}
