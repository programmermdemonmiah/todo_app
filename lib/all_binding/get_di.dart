import 'package:todo_app/view_model/controller/common/language/language_controller.dart';
import 'package:todo_app/view_model/controller/common/shared_prefs/prefs_controller.dart';
import 'package:todo_app/view_model/controller/common/theme/theme_controller.dart';
import 'package:get/get.dart';

init() async {
  await PrefsController.onInit();
  Get.lazyPut(() => ThemeController(), fenix: true);
  Get.lazyPut(() => LanguageController(), fenix: true);

  // NotificationServices.firebaseInit();
  // Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseUrl));
}
