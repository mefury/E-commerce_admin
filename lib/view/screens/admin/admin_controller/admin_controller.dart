import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  RxBool loading = false.obs;

  Rx<Uint8List> fileBytes = Uint8List(0).obs;

  String fileName = "";

  Rx<TextEditingController> bannerName = TextEditingController().obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null && result.files.isNotEmpty) {
      fileBytes.value = result.files.first.bytes!;

      fileName = result.files.first.name;

      // final mime = lookupMimeType('', headerBytes: fileBytes);
      // return DocModel(
      //   name: fileName,
      //   mimeType: mime,
      //   fileBytes: fileBytes,
      //   file: File.fromRawPath(fileBytes!),
      // );
    }
  }

  saveBanner() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      CollectionReference banners =
          FirebaseFirestore.instance.collection('banners');

      final spaceRef = storageRef.child("bannerImages/$fileName");
      // Upload raw data.
      await spaceRef.putData(fileBytes.value);

      String imagePath = await spaceRef.getDownloadURL();

      if (imagePath.isNotEmpty) {
        banners
            .add({
              'banner_name': bannerName.value.text,
              'banner_image': imagePath,
            })
            .then((value) => navigator?.pop())
            .catchError((error) => print("Failed to add user: $error"));
      }
    } on FirebaseException catch (e) {
      print("Error==================$e");
    }
  }
}
