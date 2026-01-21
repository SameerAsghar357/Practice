// ignore_for_file: unused_import

import 'package:api_practice/Api_Services/user_api.dart';
import 'package:api_practice/Models/users_model.dart';
import 'package:flutter/material.dart';

class UserApiScreen extends StatelessWidget {
  const UserApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserApi userApi = UserApi();
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Checking Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: userApi.fetchUserApi(),
                builder: (context, AsyncSnapshot<List<Users_Model>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    // return ListView.builder(
                    //   itemCount: userApi.userList.length,
                    //   itemBuilder: (context, index) {
                    // 1:
                    // return ListTile(
                    //   leading: Text(
                    //     snapshot.data![index].id.toString(),
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    //   title: Text(snapshot.data![index].name.toString()),
                    //   subtitle: Text(
                    //     snapshot.data![index].email.toString(),
                    //   ),
                    //   trailing: Text(
                    //     "From - " +
                    //         snapshot.data![index].address!.city.toString(),
                    //   ),
                    // );
                    // return Text(
                    //   snapshot.data![index].address!.geo!.lat.toString(),
                    // );
                    // 2:

                    //   },
                    // );
                    return Text(snapshot.data![1].name.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
