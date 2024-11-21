import 'package:todo_app/res/app_routes/app_routes_name.dart';
import 'package:todo_app/view/auth/signin/sign_in_view.dart';
import 'package:todo_app/view/home/home_view.dart';
import 'package:todo_app/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: AppRoutesName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: AppRoutesName.homeView,
          page: () => const HomeView(),
        ),
        GetPage(
          name: AppRoutesName.signInView,
          page: () => const SignInView(),
          // transitionDuration: const Duration(milliseconds: 250),
          // transition: Transition.leftToRightWithFade,
        ),
        // GetPage(
        //   name: AppRoutesName.listedView,
        //   page: () => const ListenView(),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.authConfirmView,
        //   page: () => AuthConfirmView(email: Get.arguments.toString()),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.accountInfoView,
        //   page: () => AccountInfoView(),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.numberVerifyView,
        //   page: () => NumberVerifyView(
        //     phoneNumber: Get.arguments.toString(),
        //   ),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.identificationView,
        //   page: () => IdentificationView(),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.identificationReView,
        //   page: () => const IdentificationReview(),
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.rightToLeftWithFade,
        // ),
        // GetPage(
        //   name: AppRoutesName.earningsView,
        //   page: () => const EarningsView(),
        // ),
        // GetPage(
        //   name: AppRoutesName.profileView,
        //   page: () => ProfileView(),
        // ),
        // GetPage(
        //   name: AppRoutesName.securityView,
        //   page: () => const SecurityView(),
        // ),
        // GetPage(
        //   name: AppRoutesName.notificationsView,
        //   page: () => NotificationsView(
        //     notificationList: Get.arguments,
        //   ),
        // ),
        // GetPage(
        //   name: AppRoutesName.chatView,
        //   page: () => ChatView(),
        // ),
        // GetPage(
        //   name: AppRoutesName.conversationView,
        //   page: () => ConversationView(conversation: Get.arguments),
        // ),
      ];

  //================
  //==========routing section========
  // //============
  // static goToConversationView({required ConversationModel conversation}) {
  //   Get.toNamed(AppRoutesName.conversationView, arguments: conversation);
  // }
  // static goCartView({
  //   required String image,
  //   required CartProductsModel item,
  // }) {
  //   Get.toNamed(AppRoutesName.itemDetails,
  //       arguments: {'image': image, 'item': item});
  // }

  // static goCategoryItemsView() {
  //   Get.toNamed(AppRoutesName.categoryItemsView);
  // }
}
