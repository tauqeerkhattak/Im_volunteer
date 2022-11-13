import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/services/chat_service.dart';
import 'package:i_am_volunteer/services/locator.dart';

import '../models/chat_item.dart';
import '../services/auth_service.dart';

class ChatScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool loading = false.obs;
  TextEditingController messageText = TextEditingController();
  FocusNode messageTextFocus = FocusNode();
  ScrollController scrollController = ScrollController();
  final chatService = locator.get<ChatService>();
  final authService = locator.get<AuthService>();
  Rx<List<ChatItem>> messages = Rx<List<ChatItem>>([]);

  @override
  void onInit() {
    super.onInit();
    scrollToBottom();
    createChat();
    subscribeForMessages();
  }

  void subscribeForMessages() {
    chatService.chatStreams().listen((event) {
      if (event.isNotEmpty) {
        const equality = ListEquality();
        if (!equality.equals(event, messages.value)) {
          messages.value = event;
        }
      }
    });
  }

  Future<void> createChat() async {
    loading.value = true;
    if (await chatService.chatExists()) {
      log('Chat exists');
    } else {
      log('chat does not exist!');
      await chatService.createChat();
    }
    loading.value = false;
  }

  @override
  void dispose() {
    messageText.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void removeFocus() {
    if (messageTextFocus.hasFocus) {
      messageTextFocus.unfocus();
    }
  }

  void scrollToBottom() {
    // Future.delayed(const Duration(milliseconds: 100), () {
    //   scrollController.animateTo(scrollController.position.maxScrollExtent,
    //       duration: const Duration(milliseconds: 1),
    //       curve: Curves.fastOutSlowIn);
    // });
  }

  Future<bool> onBack() async {
    removeFocus();
    if (!messageTextFocus.hasFocus) {
      Get.back();
    }
    return Future.value(false);
  }

  Future<void> sendText() async {
    String text = messageText.text.trim();
    if (text.isNotEmpty) {
      messageText.clear();
      await chatService.sendChat(text);
    }
  }
}
