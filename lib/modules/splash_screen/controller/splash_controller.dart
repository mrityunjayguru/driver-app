import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_prefrance.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    checkTokenAndNavigate();

  }

  void checkTokenAndNavigate() async {
    // Delay for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if the API token exists in AppPreference
    String? apiToken = await AppPreference.getStringFromSF(AppPreference.accessTokenKey);
    // debugPrint("API TOKEN ========> $apiToken");
    if (apiToken != null && apiToken.isNotEmpty) {
      // If token exists, navigate to BottomBar

    } else {

    }
    Get.offNamed(Routes.LOGIN);
  }

}
// Get.offAllNamed(Routes.LOGIN)Get.offAllNamed(Routes.LOGIN)