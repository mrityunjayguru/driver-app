
import 'package:route_roster_pro/modules/bottom_screen/view/bottom_bar_view.dart';

import '../../../utils/app_prefrance.dart';
import '../../../utils/common_import.dart';
import '../../../utils/enums.dart';
import '../../driver/track_screen/view/route_list.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<LoginType> loginType = LoginType.guardian.obs;
  Rx<LoginType> displayNameLeft = LoginType.coordinator.obs;
  Rx<LoginType> displayNameRight = LoginType.driver.obs;
  RxString errorEmail = ''.obs;
  RxString errorPassword = ''.obs;
  RxBool isWrongUser = false.obs;
  RxBool obscureText = false.obs;

  void validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      isWrongUser.value = true;
      errorEmail.value = "Please enter a valid email ID";
    } else if (!GetUtils.isEmail(email)) {
      isWrongUser.value = true;
      errorEmail.value = "Please enter a valid email ID";
    } else {
      errorEmail.value = '';
      if (errorPassword.value.isEmpty) {
        isWrongUser.value = false;
      }
    }
  }

  void validatePassword() {
    final password = passwordController.text;
    if (password.isEmpty) {
      isWrongUser.value = true;
      errorPassword.value = "Please enter a valid password";
    } else if (password.length < 2) {
      isWrongUser.value = true;
      errorPassword.value = "Please enter a valid password";
    } else {
      errorPassword.value = '';
      if (errorEmail.value.isEmpty) {
        isWrongUser.value = false;
      }
    }
  }

  void checkLoginType(LoginType val){
    loginType.value = val;
    changeDisplayName();
  }
  void changeDisplayName(){
    if(loginType.value == LoginType.guardian){
      displayNameLeft.value = LoginType.coordinator;
      displayNameRight.value = LoginType.driver;
    }
    else if(loginType.value == LoginType.coordinator){
      displayNameLeft.value = LoginType.guardian;
      displayNameRight.value = LoginType.driver;
    }
    else{
      displayNameLeft.value = LoginType.guardian;
      displayNameRight.value = LoginType.coordinator;
    }
  }

  void login() async {

    await AppPreference.addStringToSF(AppPreference.loginType, loginType.value.name);

    if(loginType.value == LoginType.guardian){
      Get.off(BottomBarView());
    }
    else if(loginType.value == LoginType.coordinator){
      Get.off(BottomBarView());
    }
    else{
      Get.off(RouteListView());
    }

  }


}
