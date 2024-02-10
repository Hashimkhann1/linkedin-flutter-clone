

import 'package:get/get.dart';

class LoadingGetx extends GetxController {
  RxBool isLoading = false.obs;

  void setLoading () {
    isLoading.value = !isLoading.value;
  }
}