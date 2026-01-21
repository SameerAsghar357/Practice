// ignore_for_file: unused_import

import 'package:api_practice/Api_Services/list_users.dart';
import 'package:api_practice/Models/list_users_model.dart';
import 'package:flutter/material.dart';

class ListUsersApiScreen extends StatelessWidget {
  const ListUsersApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListUsers listUsers = ListUsers();
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
                future: listUsers.fetchListUsersApi(),
                builder:
                    (context, AsyncSnapshot<List<List_Users_Model>> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: 20),
                            Text(snapshot.data![0].username.toString()),
                            Text(
                              snapshot.data![0].address!.geolocation!.lat
                                  .toString(),
                            ),
                            Text(snapshot.data![1].username.toString()),
                          ],
                        );
                      }
                      // } else {
                      //   return ListView.builder(
                      //     itemCount: listUsers.usersList.length,
                      //     itemBuilder: (context, index) {
                      //       return Card(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             children: [
                      //               Text(snapshot.data![index].name.toString()),
                      //               Text(
                      //                 snapshot.data![index].email.toString(),
                      //               ),
                      //               Text(
                      //                 snapshot.data![index].address!.city
                      //                     .toString(),
                      //               ),
                      //               Text(
                      //                 snapshot.data![index].address!.street!
                      //                     .toString(),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   );
                      // }
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
