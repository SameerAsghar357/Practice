import 'package:firebase/singup_options/authController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CodeVerificationPracticeScreen extends StatelessWidget {
  final String verificationId;
  CodeVerificationPracticeScreen({super.key, required this.verificationId});
  final AuthController getXcontroller = Get.put(AuthController());
  final auth = FirebaseAuth.instance;
  final codeController = TextEditingController();

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
                controller: codeController,
                decoration: InputDecoration(
                  hintText: "Code",
                  // border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  getXcontroller.loading.value = true;
                  final credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.toString(),
                  );
                  auth
                      .signInWithCredential(credential)
                      .then((value) {
                        getXcontroller.loading.value = false;
                        Get.snackbar(
                          "Verificatoin Done",
                          "Login Successfull",
                          backgroundColor: Colors.green.shade600,
                        );
                      })
                      .onError((error, stackTrace) {
                        getXcontroller.loading.value = false;
                        Get.snackbar(
                          "Verificatoin Failed",
                          "Error: ${error.toString()}",
                          backgroundColor: Colors.red.shade600,
                        );
                      });
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
                                "Verify",
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
