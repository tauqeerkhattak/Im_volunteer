import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/models/event_model.dart';

import '../routes/app_routes.dart';
import '../utils/app_colors.dart';
import 'custom_text.dart';

class EventWidget extends StatelessWidget {
  final EventModel event;
  final Function()? onApplyForVolunteer;
  final Function()? onPostTapped;
  final bool showBottomWidgets;

  const EventWidget({
    Key? key,
    required this.event,
    this.onApplyForVolunteer,
    this.onPostTapped,
    this.showBottomWidgets = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.07),
              blurRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                _profileImageWidget(
                  image: event.adminImage!,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: event.adminName!,
                        color: AppColors.primary,
                        weight: FontWeight.w600,
                      ),
                      CustomText(
                        text: event.title!,
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            _postImage(
              event.image!,
            ),
            const SizedBox(height: 7),
            if (showBottomWidgets)
              _bottomWidgetOfPost(
                event.openEvent ?? true,
              ),
          ],
        ),
      ),
    );
  }

  Widget _profileImageWidget({required String image}) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.primary.withOpacity(0.4),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(image, fit: BoxFit.cover,),),
    );
  }

  Widget _postImage(String image) {
    return InkWell(
      onTap: onPostTapped,
      child: Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _bottomWidgetOfPost(bool isEventOpen) {
    return Row(
      children: [
        const Icon(
          Icons.favorite_border,
        ),
        const SizedBox(
          width: 13,
        ),
        const Icon(
        Icons.chat_bubble_outline,
        ),
        const Spacer(),
        isEventOpen
            ? GestureDetector(
                onTap: onApplyForVolunteer,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: const CustomText(
                    text: 'Apply For Volunteer',
                    weight: FontWeight.w600,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
