import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvvm/data/api_endPoints.dart';
import 'package:mvvm/resources/components/custom_buttons.dart';
import 'package:mvvm/utils/Utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/viewmodel/User_Model.dart';
import 'package:mvvm/viewmodel/auth_repository.dart';
import 'package:mvvm/viewmodel/moviesList_viewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> listenableValue = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final providerAuth = Provider.of<AuthRepository>(context, listen: false);
    final providerUser = Provider.of<UserModel>(context, listen: false);
    final providerML = Provider.of<MLViewModel>(context, listen: false);
    DateTime? lastPressed;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          lastPressed = now;
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Login Screen'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // hint: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                SizedBox(height: 20),

                ValueListenableBuilder<bool>(
                  valueListenable: listenableValue,
                  builder: (context, value, child) {
                    try {
                      debugPrint('ValueListenableBuilder called');
                      return TextFormField(
                        controller: passwordController,
                        obscureText: value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          // hint: Text('Password'),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              listenableValue.value = !listenableValue.value;
                            },
                            child: value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                      return Container();
                    }
                  },
                ),

                SizedBox(height: 40),

                Consumer<AuthRepository>(
                  builder: (_, value, __) {
                    return CustomButtons(
                      loading: value.loading,
                      title: 'Login',
                      onTap: () async {
                        if (textController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          Utils().flushbarMessage(
                            'Email or Password cannot be empty',
                            context,
                          );
                        } else if (textController.text !=
                                'eve.holt@reqres.in' ||
                            passwordController.text != 'cityslicka') {
                          Utils().toastMessage(
                            'Email or Password is not correct',
                          );
                        } else {
                          Map data = {
                            'email': textController.text,
                            'password': passwordController.text,
                          };
                          dynamic response = await providerAuth.getloginApi(
                            ApiEndpoints.login_url,
                            data,
                            context,
                          );
                          if (response != null) {
                            debugPrint('Login successful');
                            bool valueSaved = await providerUser.setUser(
                              response['token'],
                            );

                            if (valueSaved) {
                              debugPrint(response['token'].toString());
                            } else {
                              debugPrint('Token Value not saved');
                            }
                            // sp.setString('token', response['token']);
                            // final token = response['token'];
                            debugPrint(response.toString());
                            Timer(Duration(seconds: 1), () {
                              providerML.getMoviesList();
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesNames.home,
                              );
                            });
                          } else {
                            debugPrint('api hit failed');
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
