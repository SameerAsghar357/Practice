import 'package:firebase/singup_options/login_practice.dart';
import 'package:firebase/singup_options/authController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SignUpPracticeScreen extends StatefulWidget {
  const SignUpPracticeScreen({super.key});

  @override
  State<SignUpPracticeScreen> createState() => _SignUpPracticeScreenState();
}

class _SignUpPracticeScreenState extends State<SignUpPracticeScreen> {
  final AuthController getXcontroller = Get.put(AuthController());
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignUp', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  getXcontroller.loading.value = true;
                  Get.to(() => LoginPracticeScreen());
                  auth
                      .createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString(),
                      )
                      .then((value) {
                        getXcontroller.loading.value = false;
                        // ScaffoldMessenger.of(Get.context!).showSnackBar(
                        //   SnackBar(
                        //     content: Text(
                        //       "Done with Value: ${value.toString()}",
                        //     ),
                        //   ),
                        // );
                        // Get.snackbar("Done", "Value: ${value.toString()}");
                        Get.snackbar(
                          "SignUp Successfull",
                          // "Value: ${value.toString()}",
                          "",
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20,
                          ),
                        );
                      })
                      .onError((error, stacktrace) {
                        getXcontroller.loading.value = false;
                        Get.snackbar(
                          "SignUp Failed",
                          "Error: ${error.toString()}",
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20,
                          ),
                          backgroundColor: Colors.red.shade400,
                        );
                        debugPrint(
                          "error: ${error.toString()} \n stackTrace: ${stacktrace.toString()}",
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
                                "SignUp",
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
