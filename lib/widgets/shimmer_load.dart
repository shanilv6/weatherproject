
import 'package:get/get.dart';

class ShimmerController extends GetxController {
  var isLoadingCompleted = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      isLoadingCompleted.value = true;
    });
  }
}
