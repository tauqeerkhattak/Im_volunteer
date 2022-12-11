import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/services/firestore_service.dart';
import 'package:i_am_volunteer/services/locator.dart';

class EventController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = false.obs;
  final firestoreService = locator<FirestoreService>();

  Future<void> likeEvent(String eventId) async {
    await firestoreService.likeEvent(eventId);
  }

  Future<void> unlikeEvent(String eventId) async {
    await firestoreService.unlikeEvent(eventId);
  }


}
