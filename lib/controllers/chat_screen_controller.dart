import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController messageText=TextEditingController();
  FocusNode messageTextFocus=FocusNode();
  ScrollController scrollController=ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollToBottom();
  }
  @override
  void dispose() {
    messageText.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void removeFocus(){
    if(messageTextFocus.hasFocus){
      messageTextFocus.unfocus();
    }
  }
  void scrollToBottom(){
    Future.delayed(const Duration(milliseconds: 100 ),(){
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),curve: Curves.fastOutSlowIn);
    });
  }
  Future<bool> onBack() async{
    removeFocus();
   if(!messageTextFocus.hasFocus){
      Get.back();
    }
    return Future.value(false);

  }
}