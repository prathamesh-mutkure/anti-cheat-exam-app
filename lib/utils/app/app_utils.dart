import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class AppUtils {
  AppUtils._();

  static showToast(String msg) {
    EasyLoading.showToast(
      msg,
      toastPosition: EasyLoadingToastPosition.bottom,
    );
  }

  static showLoading(String message) {
    EasyLoading.show(
      status: message,
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static dismissLoading() {
    EasyLoading.dismiss();
  }
}
