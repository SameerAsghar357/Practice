import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/Utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/viewmodel/User_Model.dart';
import 'package:mvvm/viewmodel/moviesList_viewModel.dart';
import 'package:provider/provider.dart';

class moviesListScreen extends StatelessWidget {
  const moviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () async {
                final isRemoved = await providerUser.removeUser();
                if (isRemoved) {
                  // Utils().flushbarMessage('User Logout Successfully', context);
                  Utils().toastMessage('User Logout Successfully');
                  Timer(
                    Duration(milliseconds: 800),
                    () => Navigator.pushReplacementNamed(
                      context,
                      RoutesNames.login,
                    ),
                  );
                }
              },
              icon: Icon(Icons.logout, color: Colors.grey.shade900),
            ),
          ],
          backgroundColor: Colors.blue.shade100,
          centerTitle: true,
          title: Text(
            'Movies',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Consumer<MLViewModel>(
          builder: (_, value, __) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    final rating = providerML.getAverageRating(
                      providerML.moviesList.data!.movies![index].ratings!
                          .toList(),
                    );
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList.data!.movies![index].posterurl
                              .toString(),
                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.info, color: Colors.red);
                          },
                        ),
                        title: Text(
                          value.moviesList.data!.movies![index].title
                              .toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          value.moviesList.data!.movies![index].year.toString(),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amberAccent),
                            Text(rating.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
