
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:kayoof/data/api_client/api_client.dart';
// import 'package:kayoof/data/api_response/api_response.dart';
// import 'package:kayoof/res/app_routes/app_routes_name.dart';
// import 'package:kayoof/utils/app_constant.dart';
// import 'package:kayoof/view_model/controller/common/prefs_controller.dart';
// import 'package:kayoof/view_model/controller/home/home_controller.dart';

// class NotificationServices {
//   final ApiClient apiClient;

//   NotificationServices({required this.apiClient}) {
//     _initializeNotifications();
//     firebaseInit();
//   }

//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialize Local Notifications Plugin
//   void _initializeNotifications() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@drawable/ic_notification');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) async {
//         // Check if the response contains a payload
//         if (response.payload != null) {
//           _handleNotificationTap(response.payload!);
//         }
//       },
//     );
//   }

//   Future<String?> notificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//     String? deviceToken = '@';

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("user granted permission");
//       deviceToken = await getDeviceToken();
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user granted provisional permission");
//       deviceToken = await getDeviceToken();
//     } else {
//       print("user not granted permission");
//       deviceToken = await getDeviceToken();
//     }
//     return deviceToken;
//   }

//   Future<String?> getDeviceToken() async {
//     String? deviceToken = '@';
//     try {
//       deviceToken = (await messaging.getToken())!;
//     } catch (error) {
//       debugPrint('Error ====> $error');
//     }
//     if (deviceToken != null) {
//       debugPrint('--------Device Token---------- $deviceToken');
//     }
//     return deviceToken;
//   }

//   // Firebase Messaging Initialization for Handling Notifications
//   void firebaseInit() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (message.notification != null) {
//         _showNotification(
//           message.notification!.title ?? 'No Title',
//           message.notification!.body ?? 'No Body',
//           message.data['route'] ?? '',
//           message.data['image'] ?? '',
//         );
//       }
//     });
//   }

//   // Method to Show Local Notification with Image
//   Future<void> _showNotification(
//       String title, String body, String payload, String imageUrl) async {
//     BigPictureStyleInformation? bigPictureStyle;

//     // If the image URL is not empty, download and convert it to a bitmap
//     if (imageUrl.isNotEmpty) {
//       final ByteArrayAndroidBitmap largeIcon =
//           await _getBitmapFromUrl(imageUrl);
//       bigPictureStyle = BigPictureStyleInformation(
//         largeIcon,
//         contentTitle: title,
//         summaryText: body,
//       );
//     }

//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'kayoof_channel_id',
//       'Kayoof Notifications',
//       channelDescription: 'This channel is used for Kayoof app notifications',
//       importance: Importance.high,
//       priority: Priority.high,
//       icon: '@drawable/ic_notification',
//       styleInformation: bigPictureStyle,
//     );

//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: payload,
//     );
//   }

// // Function to download the image and convert it into a ByteArrayAndroidBitmap
//   Future<ByteArrayAndroidBitmap> _getBitmapFromUrl(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));

//     // Get image bytes from the response
//     if (response.statusCode == 200) {
//       final Uint8List bytes = response.bodyBytes;
//       final ByteArrayAndroidBitmap largeIcon = ByteArrayAndroidBitmap(bytes);
//       return largeIcon;
//     } else {
//       throw Exception("Failed to load image");
//     }
//   }

//   // Handle Notification Tap
//   void _handleNotificationTap(String payload) {
//     Get.offNamed(AppRoutesName.notificationsView);
//     Get.delete<HomeController>();
//   }

//   // Update Device ID
//   updateDeviceId() async {
//     String? deviceToken = '@';

//     if (defaultTargetPlatform == TargetPlatform.iOS) {
//       FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//           alert: true, badge: true, sound: true);
//       NotificationSettings settings =
//           await FirebaseMessaging.instance.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         deviceToken = (await getDeviceToken())!;
//       }
//     } else {
//       deviceToken = (await getDeviceToken())!;
//     }

//     // API Call to Update Device ID
//     final request = await putDeviceId(deviceId: deviceToken);
//     if (request.isSuccess) {
//       debugPrint('Successfully updated Device ID: $deviceToken');
//     } else {
//       return updateDeviceId();
//     }
//   }

//   Future<ResponseModel> putDeviceId({required String deviceId}) async {
//     return await apiClient.requestWrapper(
//       () async {
//         final response = await apiClient.instance.put(
//           AppConstant.updateDeviceUri(),
//           data: {
//             "user_id": int.parse(PrefsController.userId.toString()),
//             "device_id": deviceId,
//           },
//         );
//         final data = response.data;

//         return ResponseModel(true, "Successfully updated deviceId", data);
//       },
//     );
//   }

//   Future<ResponseModel> getAllNotifications() async {
//     return await apiClient.requestWrapper(
//       () async {
//         final response = await apiClient.instance.get(
//             AppConstant.notificationsUri(
//                 int.parse(PrefsController.userId.toString())));
//         final data = response.data;

//         return ResponseModel(true, "Successfully updated deviceId", data);
//       },
//     );
//   }
// }
