
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../routes/app_routes.dart';
import 'custom_bottom_navbar_controller.dart';


class CalenderScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late List<DateTime> toHighlight= [];
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay=DateTime.now().obs;
  final kToday = DateTime.now();
  late DateTime kFirstDay;
  late DateTime kLastDay;
  CustomBottomNavBarController bottomNavigationController = Get.find(tag: AppRoutes.kBottomNavigationController);
  Future<bool> onWillPop() {
    bottomNavigationController.selectedNav.value = 2;
    Get.back();

    return Future.value(false);
  }

  @override
  void onInit() {

    kFirstDay= DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    int selectedDT=kLastDay.millisecondsSinceEpoch;
    FirebaseFirestore.instance.collection('events').doc("r8mwOsRXZxpBRYVBCYOb").update({
      'date': selectedDT
    });
    FirebaseFirestore.instance.collection('events').doc("O14vbI6z9DaNjB1Qm7ds").update({
      'date': kFirstDay.microsecondsSinceEpoch
    });
    var k = DateTime.fromMillisecondsSinceEpoch(selectedDT);
    // toHighlight.add(kLastDay);
    toHighlight.add(kFirstDay);
    toHighlight.add(k);
    // toHighlight= List<DateTime>.generate(60, (i) =>
    //     DateTime.utc(
    //       DateTime.now().year,
    //       DateTime.now().month,
    //       DateTime.now().day,
    //     ).add(Duration(days: i,)));


    // to insert database you can use dateTimeObject.millisecondsSinceEpoch to convert it to an int and save that to your db.
    //
    // if you want you can use DateTime.fromMillisecondsSinceEpoch(msIntFromServer) to convert it back to a DateTime object.

    super.onInit();
  }
}