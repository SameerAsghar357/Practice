import 'package:flutter/widgets.dart';
import 'package:mvvm/utils/Utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/viewmodel/User_Model.dart';
import 'package:mvvm/viewmodel/moviesList_viewModel.dart';
import 'package:provider/provider.dart';

class SplashServices {
  UserModel auth = UserModel();

  void getAuthetication(BuildContext context) async {
    await auth
        .getUser()
        .then((value) {
          if (value == 'null' || value == '') {
            // Future.delayed(Duration(seconds: 1));
            Navigator.pushNamed(context, RoutesNames.login);
          } else {
            Navigator.pushNamed(context, RoutesNames.home);
            final providerMoviesList = Provider.of<MLViewModel>(
              context,
              listen: false,
            );
            providerMoviesList.getMoviesList();
          }
        })
        .onError((error, stackTrace) {
          Utils().flushbarMessage(error.toString(), context);
        });
  }
}
