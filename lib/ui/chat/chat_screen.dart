import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/chat_screen_controller.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_scaffold.dart';

class ChatScreen extends StatelessWidget {
  final controller = Get.find<ChatScreenController>();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onBack,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Chat Screen',
    );
  }

  Widget _getBody() {
    return SizedBox(
      height: Get.height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
            child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              child: StreamBuilder(
                stream: controller.chatService.chatStreams(),
                builder: (context, snapshot) {},
              ),
            ),
          ),
          widgetTypeMessage(),
        ],
      ),
    );
  }

  Widget widgetTypeMessage() {
    return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 3, top: 4),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    elevation: 3.0,
                    fillColor: Colors.grey[300],
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: Icon(
                      Icons.image,
                      size: 20.0,
                      color: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      textAlign: TextAlign.left,
                      controller: controller.messageText,
                      keyboardType: TextInputType.text,
                      focusNode: controller.messageTextFocus,
                      decoration: InputDecoration(
                        hintText: 'Type Message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.7),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: Colors.grey[300],
                        prefixIcon: Icon(Icons.emoji_emotions_sharp,
                            color: AppColors.heading.withOpacity(0.3)),
                      ),
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    elevation: 3.0,
                    fillColor: Colors.grey[300],
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: Icon(
                      Icons.send,
                      size: 20.0,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget senderMessage({required String senderMessage}) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: Text(
          senderMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget recipientMessage({required String recipientMessage}) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: Text(
          recipientMessage,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
