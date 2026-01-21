import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_Response.dart';
import 'package:mvvm/model/moviesListModel.dart';
import 'package:mvvm/repository/moviesList.dart';

class MLViewModel with ChangeNotifier {
  final mlARauth = MLClass();

  ApiResponse<moviesListModel> moviesList = ApiResponse.loading();

  String getAverageRating(List<int> ratingList) {
    double rating = 0.0;
    for (int i = 0; i < ratingList.length; i++) {
      rating += ratingList[i];
    }
    // notifyListeners();
    return (rating / ratingList.length).toStringAsFixed(2);
  }

  void setMoviesList(ApiResponse<moviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> getMoviesList() async {
    setMoviesList(ApiResponse.loading());
    mlARauth
        .moviesList()
        .then((value) {
          setMoviesList(ApiResponse.completed(value));
        })
        .onError((error, stackTrace) {
          debugPrint(error.toString());
          setMoviesList(ApiResponse.error(error.toString()));
        });
  }
}
