import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/manage_event_controller.dart';
import 'package:i_am_volunteer/widgets/custom_scaffold.dart';

class VolunteerCards extends StatelessWidget {
  final controller = Get.put(ManageEventController());

  VolunteerCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBottomNavigation: false,
      scaffoldKey: controller.scaffoldKey,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users').doc("Y3feimlhlSOu4iDotiSK9nIM5ZC2").collection("eventCards").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return Wrap(
              alignment: WrapAlignment.center,
              // shrinkWrap: true,
              // itemCount: snapshot.data!.docs.length,
              // itemBuilder: ((context, index) {
              children:
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                // return Text("data ${data['email']}");
                return Container(
                  height: 35,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                      onTap: (){
                        controller.download(data['volunteerCard']);
                      },
                      child: Text(data['eventName'])),);
              }).toList());
        },
      ), screenName: 'Manage Events',
    );
  }
}
