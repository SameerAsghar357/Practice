import 'package:firebase/singup_options/authController.dart';
import 'package:firebase/singup_options/code_verification_practice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
  PhoneNumberVerificationScreen({super.key});

  final AuthController getXcontroller = Get.put(AuthController());
  final auth = FirebaseAuth.instance;
  final smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Phone Number Verification',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: smsController,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  // border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  getXcontroller.loading.value = true;
                  auth.verifyPhoneNumber(
                    phoneNumber: smsController.text.toString(),
                    verificationCompleted: (_) {
                      getXcontroller.loading.value = false;
                      Get.snackbar(
                        "Verification Completed",
                        "",
                        backgroundColor: Colors.green.shade600,
                      );
                      debugPrint("");
                    },
                    verificationFailed: (error) {
                      getXcontroller.loading.value = false;
                      Get.snackbar(
                        "Verification Failed",
                        "Error: ${error.toString()}",
                        backgroundColor: Colors.red.shade600,
                        duration: Duration(seconds: 10),
                      );
                      debugPrint(error.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      getXcontroller.loading.value = false;
                      Get.to(
                        () => CodeVerificationPracticeScreen(
                          verificationId: verificationId,
                        ),
                        duration: Duration(seconds: 10),
                      );
                      Get.snackbar(
                        "Code Sended",
                        "VerficationId: ${verificationId.toString()}",
                        backgroundColor: Colors.blue.shade600,
                      );
                      debugPrint("");
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      getXcontroller.loading.value = false;
                      Get.snackbar(
                        "Number Verifcation Timeout",
                        "",
                        backgroundColor: Colors.grey.shade600,
                      );
                      debugPrint("");
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Obx(
                      () =>
                          getXcontroller.loading.value != true
                              ? Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                              : CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
