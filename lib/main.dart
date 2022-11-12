import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/services/locator.dart';

import 'routes/app_routes.dart';
import 'services/messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  init();
  locator.get<MessagingService>().initMessaging();
  runApp(const IAmVolunteer());
}

class IAmVolunteer extends StatelessWidget {
  const IAmVolunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}
