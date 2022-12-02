import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/home_controller.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';

import '../../controllers/chat_screen_controller.dart';
import '../../models/event_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/event.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<HomeScreenController>();
  final chatController = Get.find<ChatScreenController>();
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Home Screen',
    );
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   physics: const BouncingScrollPhysics(),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       statusWidget(image: AppAssets.personImage1, text: 'Dr. ABCD'),
          //       statusWidget(image: AppAssets.personImage2, text: 'Dr. CDEF'),
          //       statusWidget(image: AppAssets.personImage3, text: 'Dr. IJKL'),
          //       statusWidget(image: AppAssets.personImage1, text: 'Dr. ABCDEF'),
          //       statusWidget(image: AppAssets.personImage2, text: 'Dr. CDEFGHI'),
          //       statusWidget(image: AppAssets.personImage3, text: 'Dr. IJKLMNO'),
          //
          //     ],
          //   ),
          // ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where("role", isEqualTo: "admin")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (snapshot.data!.size == 0) {
                return const Center(child: Text("There is no Lead"));
              }
              return SizedBox(
                height: 120,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // itemCount: snapshot.data!.docs.length,
                  // itemBuilder: ((context, index) {
                  children: snapshot.data!.docs.map(
                    (DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return statusWidget(
                          image: data['profile'], text: '${data['name']}');
                    },
                  ).toList(),
                ),
              );
              //     return Text('nodata');
              //   },),
              // );
            },
          ),

          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (snapshot.data!.size == 0) {
                return const Center(
                  child: Text(
                    "There are no events!!",
                  ),
                );
              }
              return Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map(
                    (document) {
                      final data = document.data();
                      final event = EventModel.fromJson(data);
                      return EventWidget(
                        event: event,
                        onApplyForVolunteer: () {
                          controller.onApplyVolunteer();
                        },
                        onCommentTapped: () {
                          Get.toNamed(
                            AppRoutes.eventDetails,
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              );
              //     return Text('nodata');
              //   }),
              // );
            },
          ),

          // postWidget(image: AppAssets.eventPhoto, name: 'Dr. IJKL', profileImage: AppAssets.personImage3,openEvent: false),
          // postWidget(image: AppAssets.eventPhoto2, name: 'Dr. CDEF', profileImage: AppAssets.personImage2,openEvent: true)
        ],
      ),
    );
  }

  Widget statusWidget({required String image, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primary.withOpacity(0.4),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(image, fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 7,
          ),
          CustomText(text: text),
        ],
      ),
    );
  }
}
