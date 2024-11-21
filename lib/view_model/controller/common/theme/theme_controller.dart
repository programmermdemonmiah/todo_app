import 'package:todo_app/view_model/controller/common/shared_prefs/prefs_controller.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool _darkTheme = false.obs;
  set setTheme(bool value) => _darkTheme.value = value;
  bool get darkTheme => _darkTheme.value;

  void toggleTheme() {
    setTheme = !darkTheme;
    PrefsController.setThemeName(darkTheme ? 'dark' : 'light');
    update();
    refresh();
  }

  void _loadCurrentTheme() async {
    final themeName = PrefsController.getThemeName ?? '';
    setTheme = themeName == 'dark' ? true : false;
    update();
    refresh();
  }

  @override
  void onInit() {
    super.onInit();
    _loadCurrentTheme();
  }
}
