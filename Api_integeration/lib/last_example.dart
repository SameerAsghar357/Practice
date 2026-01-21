import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/pictureModel.dart';
import 'package:http/http.dart' as http;

class LastExample extends StatefulWidget {
  const LastExample({super.key});

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {
  Future<PictureModel> getPictureApi() async {
    final response = await http.get(
      Uri.parse('https://webhook.site/64ec1ec2-db01-474e-ab70-fd14bd58bf90'),
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return PictureModel.fromJson(data);
    } else {
      return PictureModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Course')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPictureApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .1,
                            child: ListView.builder(
                              itemCount:
                                  snapshot.data!.data![index].images!.length,
                              itemBuilder: (context, position) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width: MediaQuery.of(context).size.width * .5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot
                                            .data!
                                            .data![index]
                                            .images![position]
                                            .url
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
