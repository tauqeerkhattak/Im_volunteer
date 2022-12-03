import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  Uint8List? webImage, webImage1 = Uint8List(8);
  String? localImage, localImage1;
  // TextEditingController passwordController = TextEditingController();
  pick(imageType) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      Uint8List bytes = await imagePicker.readAsBytes();
      if (imageType == 1) {
        webImage = bytes;
      } else {
        webImage1 = bytes;
      }
    } else {
      if (kDebugMode) {
        print('Pick Image First');
      }
    }
  }

  uploads(imageType) async {
    if (imageType == 1) {
      firebase_storage.Reference imageRef = firebase_storage
          .FirebaseStorage.instance
          .ref('userImages/CHBmVSIxK6gJeMnEYgcD4sVbGdF2-profile');
      UploadTask task = imageRef.putData(webImage!);
      await Future.value(task);
      localImage = await imageRef.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc("CHBmVSIxK6gJeMnEYgcD4sVbGdF2")
          .update({
        'image': localImage,
      }).then((value) {
        localImage = null;
      });
    } else {
      firebase_storage.Reference imageRef = firebase_storage
          .FirebaseStorage.instance
          .ref('userImages/CHBmVSIxK6gJeMnEYgcD4sVbGdF2-card');
      UploadTask task = imageRef.putData(webImage1!);
      await Future.value(task);
      localImage1 = await imageRef.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc("CHBmVSIxK6gJeMnEYgcD4sVbGdF2")
          .update({
        'cardImage': localImage1,
      }).then((value) {
        // localImage1 = null;
      });
    }
  }

  // Future resetEmail(String newEmail) async {
  //   var message;
  //   final user = FirebaseAuth.instance.currentUser;
  //   // await FirebaseAuth.instance.currentUser!.updateEmail(newEmail)
  //   //     .then(
  //   //       (value) => message = 'Success',
  //   // ).catchError((onError) => message = 'error');
  //   if (user != null) {
  //     final result = await InternetAddress.lookup('google.com');
  //     try {
  //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //         user.updateEmail(newEmail);
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc("CHBmVSIxK6gJeMnEYgcD4sVbGdF2")
  //       .update({
  //     'email': newEmail,
  //   }).then((value) {
  //     onBack();
  //     localImage = null;
  //   });
  //   return message;
  // }

  void onBack() {
    Get.back();
  }
}
