// ignore_for_file: unused_import

import 'package:covid_tracker/Model/countriesListModel.dart';
import 'package:covid_tracker/statsServices.dart';
import 'package:flutter/material.dart';

class checkingScreen extends StatefulWidget {
  const checkingScreen({super.key});

  @override
  State<checkingScreen> createState() => _checkingScreenState();
}

class _checkingScreenState extends State<checkingScreen> {
  statsServices statsservices = statsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: statsservices.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading...');
                } else {
                  return ListView.builder(
                    // itemCount: snapshot.data!.length,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Image(
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag'])),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
