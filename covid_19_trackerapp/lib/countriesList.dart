// ignore_for_file: unused_import

import 'package:covid_tracker/Model/countriesListModel.dart';
import 'package:covid_tracker/Model/worldstatesModel.dart';

import 'statsServices.dart';
import "package:flutter/material.dart";

class CountrieslistPage extends StatefulWidget {
  const CountrieslistPage({super.key});

  @override
  State<CountrieslistPage> createState() => _CountrieslistPageState();
}

TextEditingController _controller = TextEditingController();

class _CountrieslistPageState extends State<CountrieslistPage> {
  statsServices statsservices = statsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            TextField(
              onChanged: (value) {
                setState(() {
                  
                });
              },
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Search Country Here',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
            const SizedBox(height: 15),
            // Expanded(
              // child: FutureBuilder(
              //   future: statsservices.countriesListApi(),
              //   builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              //     // return CircularProgressIndicator();
              //     if (!snapshot.hasData) {
              //       return Text('Loading...');
              //     } else if(_controller.text == snapshot.data![index]['country'].toString()) {
              //       return ListView.builder(
              //         // itemCount: snapshot.data!.length,
              //         itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           return ListTile(
              //             onTap: () {},
              //             leading: Image(
              //                 height: 50,
              //                 image: NetworkImage(snapshot.data![index]
              //                     ['countryInfo']['flag'])),
              //             title:
              //                 Text(snapshot.data![index]['country'].toString()),
              //             subtitle:
              //                 Text(snapshot.data![index]['cases'].toString()),
              //           );
              //         },
              //       );
              //     }
              //   },
              // ),
            // ),
          ],
        ),
      )),
    );
  }
}
