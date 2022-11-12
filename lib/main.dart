import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? role = prefs.getInt("role");
  String? email = prefs.getString("email");
  String? docId = prefs.getString("docId");
  if(email ==null) runApp(const IAmVolunteer());
  else if(role=='user'){

  }
  else if(role == 'admin'){

  }
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
