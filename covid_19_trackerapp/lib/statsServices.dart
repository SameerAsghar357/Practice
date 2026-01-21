// ignore_for_file: unused_import

import 'dart:convert';

import 'package:covid_tracker/Model/countriesListModel.dart';
import 'package:covid_tracker/Model/worldstatesModel.dart';
import 'package:covid_tracker/appUrl/appUrlApi.dart';
import 'package:http/http.dart' as http;

class statsServices {
  Future<WorldStatesModel> fetchWorldStatesApi() async {
    final response = await http.get(Uri.parse(AppUrlapi.worldStatesApi));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrlapi.countriesListApi));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
}


// {
//     "updated": 1757831103232,
//     "cases": 704753890,
//     "todayCases": 0,
//     "deaths": 7010681,
//     "todayDeaths": 0,
//     "recovered": 675619811,
//     "todayRecovered": 790,
//     "active": 22123398,
//     "critical": 34794,
//     "casesPerOneMillion": 90413,
//     "deathsPerOneMillion": 899.4,
//     "tests": 7026505313,
//     "testsPerOneMillion": 884400.59,
//     "population": 7944935131,
//     "oneCasePerPeople": 0,
//     "oneDeathPerPeople": 0,
//     "oneTestPerPeople": 0,
//     "activePerOneMillion": 2784.59,
//     "recoveredPerOneMillion": 85037.8,
//     "criticalPerOneMillion": 4.38,
//     "affectedCountries": 231
// }