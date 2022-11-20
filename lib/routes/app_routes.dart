import 'package:get/get.dart';
import 'package:i_am_volunteer/ui/account/user_profile_screen.dart';
import 'package:i_am_volunteer/ui/account/volunteer_profile_screen.dart';
import 'package:i_am_volunteer/ui/calender/calender_screen.dart';
import 'package:i_am_volunteer/ui/chat/chat_screen.dart';
import 'package:i_am_volunteer/ui/home/event_details.dart';
import 'package:i_am_volunteer/ui/home/home_screen.dart';
import 'package:i_am_volunteer/ui/home/volunteer_registration_screen.dart';
import 'package:i_am_volunteer/ui/notification/notification_screen.dart';
import 'package:i_am_volunteer/ui/paid_volunteer/paid_volunteer_screen.dart';

import '../bindings/chat_bindings.dart';
import '../bindings/screen_binding.dart';
import '../ui/account/account_screen.dart';
import '../ui/auth/auth_dashboard.dart';
import '../ui/auth/login.dart';
import '../ui/auth/register.dart';
import '../ui/auth/splash.dart';
import '../ui/chat/user_list.dart';

class AppRoutes {
  static String splash = '/';
  static String login = '/login';
  static String register = '/register';
  static String authDashboard = '/auth';
  static String homeScreen = '/home_screen';
  static String calenderScreen = '/calender_screen';
  static String paidVolunteerScreen = '/paid_volunteer';
  static String notificationScreen = '/notification_screen';
  static String accountScreen = '/account_screen';
  static String volunteerRegistrationScreen = '/volunteer_registration_screen';
  static String userProfileScreen = '/user_profile_screen';
  static String volunteerProfileScreen = '/volunteer_profile_screen';
  static String chatScreen = '/chat_screen';
  static String userList = '/user_list';
  static String kBottomNavigationController = "/BOTTOM_NAVBAR_Controller";
  static String eventDetails = '/event_details';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => Splash(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: login,
      page: () => Login(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: register,
      page: () => Register(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: authDashboard,
      page: () => AuthDashboard(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        ChatBindings(),
        ScreenBinding(),
      ],
    ),
    GetPage(
      name: eventDetails,
      page: () => EventDetails(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: calenderScreen,
      page: () => CalenderScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: paidVolunteerScreen,
      page: () => PaidVolunteerScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: accountScreen,
      page: () => AccountScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: volunteerRegistrationScreen,
      page: () => VolunteerRegistrationScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: userProfileScreen,
      page: () => UserProfileScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: volunteerProfileScreen,
      page: () => VolunteerProfileScreen(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: chatScreen,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: userList,
      page: () => UserList(),
    ),
  ];
}
