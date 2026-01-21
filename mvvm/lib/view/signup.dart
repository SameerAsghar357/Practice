import 'package:flutter/material.dart';
import 'package:mvvm/data/api_endPoints.dart';
import 'package:mvvm/resources/components/custom_buttons.dart';
import 'package:mvvm/utils/Utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/viewmodel/auth_repository.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // Navigator.pushNamed(context, RoutesNames.login);
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> listenableValue = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Signup Screen')),
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
                  debugPrint('ValueListenableBuilder called');
                  return TextFormField(
                    controller: passwordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      // hint: Text('Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          listenableValue.value = !listenableValue.value;
                        },
                        child: value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Consumer<AuthRepository>(
                builder: (_, value, __) {
                  return CustomButtons(
                    loading: value.loading,
                    title: 'SignUp',
                    onTap: () async {
                      if (textController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Utils().flushbarMessage(
                          'Email or Password cannot be empty',
                          context,
                        );
                      } else if (textController.text != 'eve.holt@reqres.in' ||
                          passwordController.text != 'pistol') {
                        Utils().toastMessage(
                          'Email or Password is not correct',
                        );
                      } else {
                        Map data = {
                          'email': textController.text,
                          'password': passwordController.text,
                        };
                        debugPrint(data['email'].toString());
                        debugPrint(data['password'].toString());
                        // print(data.toString());
                        try {
                          dynamic response = await provider.getloginApi(
                            ApiEndpoints.signUp_url,
                            data,
                            context,
                          );
                          // // Response response = await provider.loginApiGet(
                          // //   ApiEndpoint.get_login_url,
                          // // );
                          if (response != null) {
                            debugPrint('signUp successful');
                            debugPrint(response.toString());
                          } else {
                            debugPrint('api hit failed');
                            // print(response.body.toString());
                          }
                        } catch (e) {
                          Utils().flushbarMessage(e.toString(), context);
                        }
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.login);
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
