import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class checkingScreen extends StatelessWidget {
  const checkingScreen({super.key});

  Future<List<dynamic>> fetchApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // print(data);
      return data;
    } else {
      throw Exception('Error": ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        // elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Nothing...'),
            FutureBuilder(
                future: fetchApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading...');
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              // leading: Text(
                              //     snapshot.data![index]['userId'].toString()),
                              title: Column(
                                children: [
                                  Text(snapshot.data![index]['userId']
                                      .toString()),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
