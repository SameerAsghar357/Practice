// ignore: file_names
import 'package:get/get.dart';

class AuthController extends GetxController {
  
  final loading = false.obs;

  void isLoading(bool value) {
    loading.value = value;
  }
}
