import 'package:firebase/singup_options/authController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class LoginPracticeScreen extends StatefulWidget {
  const LoginPracticeScreen({super.key});

  @override
  State<LoginPracticeScreen> createState() => _LoginPracticeScreenState();
}

class _LoginPracticeScreenState extends State<LoginPracticeScreen> {
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
        title: Text('Login', style: TextStyle(color: Colors.white)),
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
                  auth
                      .signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString(),
                      )
                      .then((value) {
                        getXcontroller.loading.value = false;
                        Get.snackbar(
                          "Login Successfull",
                          // "Value: ${value.toString()}",
                          "",
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20,
                          ),
                          backgroundColor: Colors.green.shade400,
                        );
                      })
                      .onError((error, stacktrace) {
                        getXcontroller.loading.value = false;
                        Get.snackbar(
                          "Login Failed",
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
